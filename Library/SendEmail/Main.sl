#!!
#! @description: identify if a OS is windows and sending an email
#!!#
namespace: SendEmail
flow:
  name: Main
  inputs:
    - mailTo:
        default: hagai.revah@hpe.com
    - flowSmtpHost:
        default: smtp1.hpe.com
  workflow:
    - get_os:
        do:
          io.cloudslang.base.os.get_os: []
        publish:
          - message: Windows
        navigate:
          - LINUX: FAILURE
          - WINDOWS: send_mail
    - send_mail:
        do:
          io.cloudslang.base.mail.send_mail:
            - hostname: "${get('flowSmtpHost')}"
            - port: "${get_sp('smtpPort')}"
            - from: "${get_sp('fromAddress')}"
            - to: "${get('mailTo')}"
            - subject: OS report
            - body: "${'the OS you have is:' + message}"
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      send_mail:
        x: 412
        y: 146
      get_os:
        x: 97
        y: 148
    results:
      SUCCESS:
        a5cb7615-bbf5-087d-1de5-2b6852667230:
          x: 718
          y: 162
      FAILURE:
        8a48caeb-f349-481d-590c-6940d096d48a:
          x: 616
          y: 388
    navigations:
      dbb56099-415b-45b8-99cc-6aa37f79a175:
        name: SUCCESS
        sourceId: send_mail
        sourcePortName: SUCCESS
        targetId: a5cb7615-bbf5-087d-1de5-2b6852667230
      78a377a9-4f95-4b9a-a6ca-7600dfc3703b:
        name: WINDOWS
        sourceId: get_os
        sourcePortName: WINDOWS
        targetId: send_mail
      847de693-e703-4fe7-9f57-c3e7d7ae8e45:
        name: LINUX
        sourceId: get_os
        sourcePortName: LINUX
        targetId: 8a48caeb-f349-481d-590c-6940d096d48a

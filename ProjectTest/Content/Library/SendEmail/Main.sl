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
    - send_mail:
        do:
          io.cloudslang.base.mail.send_mail:
            - hostname: '${flowSmtpHost}'
            - port: "${get_sp('smtpPort')}"
            - from: "${get_sp('fromAddress')}"
            - to: '${mailTo}'
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
    results:
      SUCCESS:
        a5cb7615-bbf5-087d-1de5-2b6852667230:
          x: 718
          y: 162
    navigations:
      dbb56099-415b-45b8-99cc-6aa37f79a175:
        name: SUCCESS
        sourceId: send_mail
        sourcePortName: SUCCESS
        targetId: a5cb7615-bbf5-087d-1de5-2b6852667230

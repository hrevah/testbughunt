namespace: test
flow:
  name: flowa
  workflow:
    - powershell_script:
        do:
          io.cloudslang.base.scripts.powershell_script:
            - host: myd-vm05723
            - script: ./sdasda
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      powershell_script:
        x: 366
        y: 187
        navigate:
          945dd16a-9a2b-e0f4-4c1a-396a4d7625d9:
            targetId: 57621634-6790-ac98-f473-943e8f0fb872
            port: SUCCESS
    results:
      SUCCESS:
        57621634-6790-ac98-f473-943e8f0fb872:
          x: 640
          y: 147

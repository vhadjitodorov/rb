highstate:
  schedule.present:
    - function: state.highstate
    - minutes: 60

# My Readme

Target: my_target

# INVENTORY

```
- common
- my_component

```


```
_kapitan_: null
_reclass_:
  environment: base
  name:
    full: my_target
    parts:
    - my_target
    path: my_target
    short: my_target
kapitan:
  compile:
  - continue_on_compile_error: false
    ignore_missing: false
    input_params: {}
    input_paths:
    - components/my_component/my_component.jsonnet
    input_type: jsonnet
    name: null
    output_path: jsonnet_output
    output_type: yaml
    prune: false
  - continue_on_compile_error: false
    ignore_missing: true
    input_params: {}
    input_paths:
    - templates/scripts
    input_type: jinja2
    name: null
    output_path: scripts
    output_type: plain
    prune: true
    suffix_remove: false
    suffix_stripped: .j2
  - continue_on_compile_error: false
    ignore_missing: true
    input_params: {}
    input_paths:
    - templates/docs
    input_type: jinja2
    name: null
    output_path: .
    output_type: yaml
    prune: true
    suffix_remove: false
    suffix_stripped: .j2
  - continue_on_compile_error: false
    ignore_missing: false
    input_params: {}
    input_paths:
    - components/other_component/
    input_type: kadet
    input_value: null
    name: null
    output_path: kadet_output
    output_type: yaml
    prune: false
  dependencies: []
  labels: {}
  secrets: null
  target_full_path: ''
  validate: []
  vars:
    target: my_target
target_name: my_target
your_component:
  some_parameter: true

```
Stage - Reset SSPL:
  cmd.run:
    - name: __slot__:salt:setup_conf.conf_cmd('/opt/seagate/sspl/conf/setup.yaml', 'sspl:reset')

{% import_yaml 'components/defaults.yaml' as defaults %}
Remove sspl packages:
  pkg.purged:
    - pkgs:
      - sspl
      - sspl-test

Remove flask:
  pip.removed:
    - name: flask

Delete EOSCore yum repo:
  pkgrepo.absent:
    - name: {{ defaults.sspl.repo.id }}

Delete sspl checkpoint flag:
  file.absent:
    - name: /opt/seagate/eos-prvsnr/generated_configs/{{ grains['id'] }}.sspl


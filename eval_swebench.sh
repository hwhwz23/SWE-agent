source .venv/bin/activate

max_input_tokens=32768

sweagent run-batch \
    --config config/default.yaml \
    --agent.model.name hosted_vllm/devstral-2507-$max_input_tokens \
    --agent.model.total_cost_limit 0 \
    --agent.model.per_instance_cost_limit 0 \
    --agent.model.temperature 0 \
    --agent.model.api_base http://0.0.0.0:8001/v1 \
    --agent.model.max_input_tokens ${max_input_tokens} \
    --instances.type swe_bench \
    --instances.subset verified_mini \
    --instances.split test  \
    --instances.slice :50 \
    --instances.deployment.docker_args=--memory=16g \
    --instances.deployment.docker_args=--cpuset-cpus=0 \
    --instances.shuffle=False

    # --instances.evaluate=True \

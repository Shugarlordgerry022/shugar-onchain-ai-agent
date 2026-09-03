import pytest
import json


def test_workflows_config():
    """Test workflows configuration loading"""
    with open("config/workflows.json") as f:
        workflows = json.load(f)
    
    assert "workflows" in workflows
    assert len(workflows["workflows"]) > 0
    
    workflow = workflows["workflows"][0]
    assert "id" in workflow
    assert "triggers" in workflow
    assert "conditions" in workflow
    assert "actions" in workflow

Describe "Invoke-OAIChat" -Tag Invoke-OAIChat {
    BeforeAll {
        Import-Module "$PSScriptRoot/../PowerShellAIAssistant.psd1" -Force
    }

    It "should have these parameters " {
        $actual = Get-Command Invoke-OAIChat -ErrorAction SilentlyContinue
     
        $actual | Should -Not -BeNullOrEmpty
    }

    It 'should have these parameters' {
        $actual = Get-Command Invoke-OAIChat -ErrorAction SilentlyContinue
     
        $actual | Should -Not -BeNullOrEmpty
     
        $actual.Parameters.Keys.Contains('UserInput') | Should -Be $true
     
        $actual.Parameters.UserInput.Attributes.ValueFromPipeline | Should -Be $true
     
        $actual.Parameters.Keys.Contains('Instructions') | Should -Be $true
     
        $actual.Parameters.Instructions.Aliases.Count | Should -Be 0
     
        $actual.Parameters.Keys.Contains('model') | Should -Be $true

        $validateScript = $actual.Parameters.model.Attributes | Where-Object { $_ -is [System.Management.Automation.ValidateScriptAttribute] }
        $validateScript | Should -Not -BeNullOrEmpty
        $scriptBlock = $validateScript.ScriptBlock
        $scriptBlock.ToString().Trim() | Should -BeExactly 'Test-LLMModel'
    }
}
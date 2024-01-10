Describe 'Get-OAIRun' -Tag Get-OAIRun {
    BeforeAll {
        Import-Module "$PSScriptRoot/../PowerShellAIAssistant.psd1" -Force
    }

    It 'should have these parameters ' {
        $actual = Get-Command Get-OAIRun -ErrorAction SilentlyContinue
     
        $actual | Should -Not -BeNullOrEmpty

        $actual.Parameters.Keys.Contains('threadId') | Should -Be $true
        $actual.Parameters['threadId'].Attributes.Mandatory | Should -Be $true

        $actual.Parameters.Keys.Contains('limit') | Should -Be $true

        $actual.Parameters.Keys.Contains('order') | Should -Be $true

        $validateSet = $actual.Parameters['order'].Attributes.ValidValues

        $validateSet | Should -Contain 'asc'
        $validateSet | Should -Contain 'desc'

        $actual.Parameters.Keys.Contains('after') | Should -Be $true

        $actual.Parameters.Keys.Contains('before') | Should -Be $true
    }
}
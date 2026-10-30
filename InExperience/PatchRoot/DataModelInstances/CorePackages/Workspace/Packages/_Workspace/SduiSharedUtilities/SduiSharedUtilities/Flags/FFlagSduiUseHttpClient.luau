local HttpClientModule = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.HttpClient)

return game:DefineFastFlag("SduiUseHttpClient", false) and HttpClientModule.FFlagHttpClientRetryExtensions
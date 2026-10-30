local Tokens = script.tokens
local _ = require(Tokens.Schema.Types.ComponentType)
local _ = require(Tokens.Schema.Types.GlobalType)
local _ = require(Tokens.Schema.Types.SemanticType)

return {
	tokens = {
		Common = {
			Builder = {
				Dark = {
					Component = require(Tokens.Common.Builder.Dark.Component),
					Global = require(Tokens.Common.Builder.Dark.Global),
					Semantic = require(Tokens.Common.Builder.Dark.Semantic)
				},
				Light = {
					Component = require(Tokens.Common.Builder.Light.Component),
					Global = require(Tokens.Common.Builder.Light.Global),
					Semantic = require(Tokens.Common.Builder.Light.Semantic)
				}
			},
			Dark = {
				Component = require(Tokens.Common.Dark.Component),
				Global = require(Tokens.Common.Dark.Global),
				Semantic = require(Tokens.Common.Dark.Semantic)
			},
			Light = {
				Component = require(Tokens.Common.Light.Component),
				Global = require(Tokens.Common.Light.Global),
				Semantic = require(Tokens.Common.Light.Semantic)
			}
		},
		Console = {
			Dark = {
				Component = require(Tokens.Console.Dark.Component),
				Global = require(Tokens.Console.Dark.Global),
				Semantic = require(Tokens.Console.Dark.Semantic)
			},
			Light = {
				Component = require(Tokens.Console.Light.Component),
				Global = require(Tokens.Console.Light.Global),
				Semantic = require(Tokens.Console.Light.Semantic)
			}
		},
		Desktop = {
			Builder = {
				Dark = {
					Component = require(Tokens.Desktop.Builder.Dark.Component),
					Global = require(Tokens.Desktop.Builder.Dark.Global),
					Semantic = require(Tokens.Desktop.Builder.Dark.Semantic)
				},
				Light = {
					Component = require(Tokens.Desktop.Builder.Light.Component),
					Global = require(Tokens.Desktop.Builder.Light.Global),
					Semantic = require(Tokens.Desktop.Builder.Light.Semantic)
				}
			},
			Dark = {
				Component = require(Tokens.Desktop.Dark.Component),
				Global = require(Tokens.Desktop.Dark.Global),
				Semantic = require(Tokens.Desktop.Dark.Semantic)
			},
			Light = {
				Component = require(Tokens.Desktop.Light.Component),
				Global = require(Tokens.Desktop.Light.Global),
				Semantic = require(Tokens.Desktop.Light.Semantic)
			}
		},
		Schema = {
			Map = {
				Component = require(Tokens.Schema.Map.Component),
				Global = require(Tokens.Schema.Map.Global),
				Semantic = require(Tokens.Schema.Map.Semantic)
			},
			Validators = {
				validateComponent = require(Tokens.Schema.Validators.validateComponent),
				validateGlobal = require(Tokens.Schema.Validators.validateGlobal),
				validateSemantic = require(Tokens.Schema.Validators.validateSemantic)
			}
		}
	}
}
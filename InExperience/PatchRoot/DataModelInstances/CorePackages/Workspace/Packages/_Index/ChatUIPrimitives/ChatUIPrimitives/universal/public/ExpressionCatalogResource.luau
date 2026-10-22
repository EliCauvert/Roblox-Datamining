local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local SignalsModule = require(ChatUIPrimitives.Parent.Signals)
local _ = require(ChatUIPrimitives.UniversalMessage.Types)
local CreateExpressionCatalogResourceModule = require(ChatUIPrimitives.createExpressionCatalogResource)

local function noop() end

return {
	create = function(p1)
		-- upvalues: CreateExpressionCatalogResourceModule (copy)
		return CreateExpressionCatalogResourceModule(p1)
	end,
	createStatic = function(p1)
		-- upvalues: SignalsModule (copy), noop (copy)
		return {
			getCatalog = SignalsModule.createComputed(function(_)
				-- upvalues: p1 (copy)
				return p1
			end),
			acquire = noop,
			release = noop
		}
	end
}
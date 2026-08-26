local inlineRichText = script:FindFirstAncestor("InlineRichText")
local runService = game:GetService("RunService")
local parent = inlineRichText.Parent
local reactModule = require(parent.React)
local default = require(parent.LinkingProtocol).LinkingProtocol.default
local name = require(inlineRichText.Logger):new(script.Name)
local _ = require(inlineRichText.Types)
local var1 = runService:IsStudio()

return function(_)
	-- upvalues: reactModule (ref), default (ref), var1 (ref), name (ref)
	return reactModule.useCallback(function(p1)
		-- upvalues: default (copy), var1 (copy), name (copy)
		default:isURLRegistered(p1):andThen(function(p2)
			-- upvalues: var1 (copy), p1 (ref), default (copy), name (copy)
			if not p2 then
				default:openURL(p1):catch(function(p3)
					-- upvalues: name (copy), p1 (copy)
					name:error("Failed to open URL: ", p1, " with error: ", p3)
				end)
				
				return
			elseif var1 then
				print(`[OnActivated Debug] Detected URL with LinkingProtocol: {p1}`)
			end
			default:detectURL(p1)
		end)
	end, {})
end
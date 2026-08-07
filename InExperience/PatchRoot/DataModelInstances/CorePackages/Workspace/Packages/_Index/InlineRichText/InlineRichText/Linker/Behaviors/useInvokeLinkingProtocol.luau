local inlineRichText = script:FindFirstAncestor("InlineRichText")
local runService = game:GetService("RunService")
local parent = inlineRichText.Parent
local reactModule = require(parent.React)
local default = require(parent.LinkingProtocol).LinkingProtocol.default
local name = require(inlineRichText.Logger):new(script.Name)
local _ = require(inlineRichText.Types)
local var4 = runService:IsStudio()

return function(_) --[[ line: 15 ]]
	-- upvalues: reactModule (ref), default (ref), var4 (ref), name (ref)
	return reactModule.useCallback(function(p0) --[[ line: 16 ]]
		-- upvalues: default (copy), var4 (copy), name (copy)
		default:isURLRegistered(p0):andThen(function(p1) --[[ line: 17 ]]
			-- upvalues: var4 (copy), p0 (ref), default (copy), name (copy)
			if not p1 then
				default:openURL(p0):catch(function(p2) --[[ line: 24 ]]
					-- upvalues: name (copy), p0 (copy)
					name:error("Failed to open URL: ", p0, " with error: ", p2)
				end)
				
				return
			elseif var4 then
				print(`[OnActivated Debug] Detected URL with LinkingProtocol: {p0}`)
			end
			default:detectURL(p0)
		end)
	end, {})
end
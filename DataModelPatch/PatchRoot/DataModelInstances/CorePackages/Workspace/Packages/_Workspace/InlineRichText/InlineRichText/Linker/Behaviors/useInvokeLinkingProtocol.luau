local InlineRichText = script:FindFirstAncestor("InlineRichText")
local Parent = InlineRichText.Parent
local ReactModule = require(Parent.React)
local Default = require(Parent.LinkingProtocol).LinkingProtocol.default
local NewResult = require(InlineRichText.Logger):new(script.Name)
local _ = require(InlineRichText.Types)
local IsStudio = game:GetService("RunService"):IsStudio()

return function(_)
	-- upvalues: ReactModule (copy), Default (copy), IsStudio (copy), NewResult (copy)
	return ReactModule.useCallback(function(p1)
		-- upvalues: Default (upval), IsStudio (upval), NewResult (upval)
		Default:isURLRegistered(p1):andThen(function(Result)
			-- upvalues: IsStudio (upval), p1 (copy), Default (upval), NewResult (upval)
			if not Result then
				Default:openURL(p1):catch(function(Err)
					-- upvalues: NewResult (upval), p1 (upval)
					NewResult:error("Failed to open URL: ", p1, " with error: ", Err)
				end)
				
				return
			end
			if IsStudio then
				print(`[OnActivated Debug] Detected URL with LinkingProtocol: {p1}`)
			end
			Default:detectURL(p1)
		end)
	end, {})
end
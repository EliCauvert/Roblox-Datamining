local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local textArea = foundationModule.TextArea
local textKeysModule = require(editProfile.Common.TextKeys)
local constantsModule = require(editProfile.Common.Constants)
local useLocalization = require(parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: useLocalization (ref), textKeysModule (ref), reactModule (ref), constantsModule (ref), view (ref), text (ref), textArea (ref)
	local var1 = useLocalization({
		AboutModalCaption = textKeysModule.AboutModalCaption,
		AboutPlaceholder = textKeysModule.AboutPlaceholder,
		PinLocked = textKeysModule.PinLocked,
		ThrottleError = textKeysModule.TooManyAttemptsTryAgainLater
	})
	local var2, var3 = reactModule.useState(p1.bioText)
	local var4, var5 = reactModule.useState(string.len(p1.bioText) >= 1000)
	
	local function _(p2)
		-- upvalues: var3 (ref), var5 (ref), p1 (ref)
		local var6 = string.len(p2)
		var3(p2)
		var5(var6 > 1000)
		
		if p1.onDataChange then
			p1.onDataChange(string.sub(p2, 1, 1000))
		end
	end
	
	return reactModule.createElement(view, { tag = "col size-full-0 auto-y gap-large" }, {
		Caption = reactModule.createElement(text, {
			tag = "text-body-medium text-wrap size-full-0 auto-y text-align-x-left",
			Text = var1.AboutModalCaption
		}),
		BioTextArea = reactModule.createElement(textArea, {
			label = "",
			numLines = 4,
			text = var2,
			width = UDim.new(1, 0),
			onChanged = function(p2)
				-- upvalues: var3 (ref), var5 (ref), p1 (ref)
				local var6 = string.len(p2)
				var3(p2)
				var5(var6 > 1000)
				
				if p1.onDataChange then
					p1.onDataChange(string.sub(p2, 1, 1000))
				end
			end,
			hint = if p1.errorCode then if p1.errorCode == constantsModule.DescriptionErrorCodes.PinLocked then var1.PinLocked else var1.ThrottleError else string.format("%d/%d", string.len(var2), 1000),
			placeholder = var1.AboutPlaceholder,
			hasError = var4 or p1.errorCode ~= nil,
			textBoxRef = p1.textBoxRef
		})
	})
end
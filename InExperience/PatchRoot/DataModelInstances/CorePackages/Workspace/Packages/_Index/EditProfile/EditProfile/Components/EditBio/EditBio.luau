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

return function(p0)
	-- upvalues: useLocalization (ref), textKeysModule (ref), reactModule (ref), constantsModule (ref), view (ref), text (ref), textArea (ref)
	local var5 = useLocalization({
		AboutModalCaption = textKeysModule.AboutModalCaption,
		AboutPlaceholder = textKeysModule.AboutPlaceholder,
		PinLocked = textKeysModule.PinLocked,
		ThrottleError = textKeysModule.TooManyAttemptsTryAgainLater
	})
	local var6, var7 = reactModule.useState(p0.bioText)
	local var8, var9 = reactModule.useState(string.len(p0.bioText) >= 1000)
	
	local function _(p1)
		-- upvalues: var7 (ref), var9 (ref), p0 (ref)
		local var10 = string.len(p1)
		var7(p1)
		var9(var10 > 1000)
		
		if p0.onDataChange then
			p0.onDataChange(string.sub(p1, 1, 1000))
		end
	end
	
	return reactModule.createElement(view, { tag = "col size-full-0 auto-y gap-large" }, {
		Caption = reactModule.createElement(text, {
			tag = "text-body-medium text-wrap size-full-0 auto-y text-align-x-left",
			Text = var5.AboutModalCaption
		}),
		BioTextArea = reactModule.createElement(textArea, {
			label = "",
			numLines = 4,
			text = var6,
			width = UDim.new(1, 0),
			onChanged = function(p2)
				-- upvalues: var7 (ref), var9 (ref), p0 (ref)
				local var11 = string.len(p2)
				var7(p2)
				var9(var11 > 1000)
				
				if p0.onDataChange then
					p0.onDataChange(string.sub(p2, 1, 1000))
				end
			end,
			hint = if p0.errorCode then if p0.errorCode == constantsModule.DescriptionErrorCodes.PinLocked then var5.PinLocked else var5.ThrottleError else string.format("%d/%d", string.len(var6), 1000),
			placeholder = var5.AboutPlaceholder,
			hasError = var8 or p0.errorCode ~= nil,
			textBoxRef = p0.textBoxRef
		})
	})
end
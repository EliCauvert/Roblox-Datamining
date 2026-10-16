local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ArgCheckModule = require(Parent.ArgCheck)
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)
local FoundationModule = require(Parent.Foundation)
local TextButton = require(Parent.UIBlox).App.Button.TextButton
local FFlagAppChatDomLocatorFoundationMigrationModule = require(AppChat.Flags.FFlagAppChatDomLocatorFoundationMigration)

return function(p1) --[[ Line: 14 ]]
	-- upvalues: ArgCheckModule (copy), RoactModule (copy), TextButton (copy), FFlagAppChatDomLocatorFoundationMigrationModule (copy), ReactModule (copy), FoundationModule (copy)
	local LocalizedStrings = p1.localizedStrings
	local IsDisabled = p1.isDisabled
	local OnActivatedFunction = p1.onActivated
	ArgCheckModule.isNotNil(LocalizedStrings, "props.localizedStrings")
	local Element = RoactModule.createElement(TextButton, {
		text = LocalizedStrings.systemButtonText,
		isDisabled = IsDisabled,
		onActivated = function() --[[ Line: 24 ]]
			-- upvalues: IsDisabled (copy), OnActivatedFunction (copy), LocalizedStrings (copy)
			if IsDisabled then return end
			if OnActivatedFunction then
				OnActivatedFunction(LocalizedStrings)
			end
		end
	})
	
	return if FFlagAppChatDomLocatorFoundationMigrationModule and p1.testId then ReactModule.createElement(FoundationModule.View, { tag = "auto-xy", testId = p1.testId }, { button = Element }) else Element
end
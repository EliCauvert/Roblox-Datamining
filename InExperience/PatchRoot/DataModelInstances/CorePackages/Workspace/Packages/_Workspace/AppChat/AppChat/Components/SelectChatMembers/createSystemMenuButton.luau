local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local argCheckModule = require(parent.ArgCheck)
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local foundationModule = require(parent.Foundation)
local textButton = require(parent.UIBlox).App.Button.TextButton
local fFlagAppChatDomLocatorFoundationMigrationModule = require(appChat.Flags.FFlagAppChatDomLocatorFoundationMigration)

return function(p1)
	-- upvalues: argCheckModule (ref), roactModule (ref), textButton (ref), fFlagAppChatDomLocatorFoundationMigrationModule (ref), reactModule (ref), foundationModule (ref)
	local localizedStrings = p1.localizedStrings
	local isDisabled = p1.isDisabled
	local onActivated = p1.onActivated
	argCheckModule.isNotNil(localizedStrings, "props.localizedStrings")
	local var1 = roactModule.createElement(textButton, {
		text = localizedStrings.systemButtonText,
		isDisabled = isDisabled,
		onActivated = function()
			-- upvalues: isDisabled (ref), onActivated (ref), localizedStrings (ref)
			if isDisabled then return end
			if onActivated then
				onActivated(localizedStrings)
			end
		end
	})
	
	return if fFlagAppChatDomLocatorFoundationMigrationModule and p1.testId then reactModule.createElement(foundationModule.View, { tag = "auto-xy", testId = p1.testId }, { button = var1 }) else var1
end
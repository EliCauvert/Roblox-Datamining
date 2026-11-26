local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local _ = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(BuildExperience.Chat.chatTypes)
local ReleaseFocusedTextBoxModule = require(BuildExperience.utils.releaseFocusedTextBox)
local UseClosableFocusRootModule = require(BuildExperience.utils.useClosableFocusRoot)
local _ = require(script.Parent.ChatAttachmentMenuView)

return function(Frame: Frame)
	-- upvalues: ReactModule (copy), ReleaseFocusedTextBoxModule (copy), UseClosableFocusRootModule (copy), FocusNavigationUtilsModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), UseStateResult2 (copy)
		if Frame.isDisabled then
			UseStateResult2(false)
		end
	end, { Frame.isDisabled })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: ReleaseFocusedTextBoxModule (upval), UseStateResult2 (copy)
		ReleaseFocusedTextBoxModule()
		UseStateResult2(function(p1): boolean
			return not p1
		end)
	end, {})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Frame (copy), UseStateResult2 (copy)
		local List = {}
		
		for _, item in Frame.items do
			local Callback = assert(item.onActivated, `Attachment menu item "{item.id}" needs an onActivated`)
			table.insert(List, {
				id = item.id,
				text = item.text,
				icon = item.icon,
				onActivated = function()
					-- upvalues: UseStateResult2 (upval), Callback (copy)
					UseStateResult2(false)
					Callback()
				end
			})
		end
		return List
	end, { Frame.items })
	local NoIsDisabled: boolean = UseStateResult and not Frame.isDisabled
	local UseClosableFocusRootModuleResult = UseClosableFocusRootModule({
		surfaceIdentifier = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum.ContextualMenu,
		isOpen = NoIsDisabled,
		onClose = UseResult
	})
	
	return ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), NoIsDisabled (copy), Frame (copy), UseResult1 (copy), UseResult (copy), UseClosableFocusRootModuleResult (copy)
		return {
			items = UseMemoResult,
			isOpen = NoIsDisabled,
			isDisabled = Frame.isDisabled,
			onToggle = UseResult1,
			onClose = UseResult,
			focusRootRef = UseClosableFocusRootModuleResult,
			LayoutOrder = Frame.LayoutOrder,
			testId = Frame.testId
		}
	end, {
		UseMemoResult, NoIsDisabled, Frame.isDisabled, UseResult1, UseResult,
		UseClosableFocusRootModuleResult, Frame.LayoutOrder, Frame.testId
	})
end
local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local CorePackages = game:GetService("CorePackages")
local ChatLineReportingModule = require(CorePackages.Workspace.Packages.ChatLineReporting)
local ReactModule = require(CorePackages.Packages.React)
local ChatLineReportSelectionModal = ChatLineReportingModule.ChatLineReportSelectionModal
local ChatLineSelectionMode = ChatLineReportingModule.Enums.ChatLineSelectionMode
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local _ = require(AbuseReportMenu.Components.Types)
local UseOrderedMessagesModule = require(AbuseReportMenu.Hooks.useOrderedMessages)

local function ChatModalSelectorDialog(p1)
	-- upvalues: UseStyleFunction (copy), UseOrderedMessagesModule (copy), ReactModule (copy), ChatLineReportSelectionModal (copy), ChatLineSelectionMode (copy)
	local Theme = UseStyleFunction().Theme
	local UseOrderedMessagesModuleResult = UseOrderedMessagesModule()
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy), UseOrderedMessagesModuleResult (copy)
		p1.onSelect(p2, UseOrderedMessagesModuleResult)
		p1.onClose()
	end, { UseOrderedMessagesModuleResult })
	
	return if p1.isShown then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		Overlay = ReactModule.createElement("TextButton", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			AutoButtonColor = false,
			BackgroundColor3 = Theme.Overlay.Color,
			BackgroundTransparency = Theme.Overlay.Transparency,
			Position = UDim2.fromScale(0.5, 0.5),
			Selectable = false,
			Size = UDim2.new(1, 0, 1, 0),
			Text = "",
			ZIndex = 10,
			[ReactModule.Event.Activated] = function()
				-- upvalues: p1 (copy)
				p1.onClose()
			end
		}),
		ChatLineReportSelectionModalFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 11,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, 0)
		}, ReactModule.createElement(ChatLineReportSelectionModal, {
			isCentered = true,
			onContinue = UseResult,
			onBack = p1.onClose,
			mode = ChatLineSelectionMode.Direct,
			messages = UseOrderedMessagesModuleResult,
			analyticsDispatch = function() end
		}))
	}) else nil
end

function DialogWrapper(p1)
	-- upvalues: ReactModule (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), ChatModalSelectorDialog (copy)
	return ReactModule.createElement(FocusRoot, {
		isIsolated = true,
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
	}, {
		DialogContainer = ReactModule.createElement(ChatModalSelectorDialog, p1)
	})
end

return DialogWrapper
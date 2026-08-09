local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local chatLineReportingModule = require(corePackagesService.Workspace.Packages.ChatLineReporting)
local reactModule = require(corePackagesService.Packages.React)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local chatLineReportSelectionModal = chatLineReportingModule.ChatLineReportSelectionModal
local chatLineSelectionMode = chatLineReportingModule.Enums.ChatLineSelectionMode
local focusNavigationUtilsModule = require(corePackagesService.Workspace.Packages.FocusNavigationUtils)
local useStyle = UIBloxModule.Core.Style.useStyle
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusRoot = focusNavigationUtilsModule.FocusRoot
local _ = require(abuseReportMenu.Components.Types)
local useOrderedMessagesModule = require(abuseReportMenu.Hooks.useOrderedMessages)

local function ChatModalSelectorDialog(p0) --[[ line: 28 ]]
	-- upvalues: useStyle (ref), useOrderedMessagesModule (ref), reactModule (ref), chatLineReportSelectionModal (ref), chatLineSelectionMode (ref)
	local theme = useStyle().Theme
	local var8 = useOrderedMessagesModule()
	
	return if p0.isShown then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		Overlay = reactModule.createElement("TextButton", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			AutoButtonColor = false,
			BackgroundColor3 = theme.Overlay.Color,
			BackgroundTransparency = theme.Overlay.Transparency,
			Position = UDim2.fromScale(0.5, 0.5),
			Selectable = false,
			Size = UDim2.new(1, 0, 1, 0),
			Text = "",
			ZIndex = 10,
			[reactModule.Event.Activated] = function() --[[ line: 56 ]]
				-- upvalues: p0 (ref)
				p0.onClose()
			end
		}),
		ChatLineReportSelectionModalFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 11,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, 0)
		}, reactModule.createElement(chatLineReportSelectionModal, {
			isCentered = true,
			onContinue = reactModule.useCallback(function(p1) --[[ line: 33 ]]
				-- upvalues: p0 (ref), var8 (ref)
				p0.onSelect(p1, var8)
				p0.onClose()
			end, { var8 }),
			onBack = p0.onClose,
			mode = chatLineSelectionMode.Direct,
			messages = var8,
			analyticsDispatch = function() --[[ line: 74 ]] end
		}))
	}) else nil
end

function DialogWrapper(p2) --[[ line: 80 ]]
	-- upvalues: reactModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), ChatModalSelectorDialog (ref)
	return reactModule.createElement(focusRoot, {
		isIsolated = true,
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
	}, {
		DialogContainer = reactModule.createElement(ChatModalSelectorDialog, p2)
	})
end

return DialogWrapper
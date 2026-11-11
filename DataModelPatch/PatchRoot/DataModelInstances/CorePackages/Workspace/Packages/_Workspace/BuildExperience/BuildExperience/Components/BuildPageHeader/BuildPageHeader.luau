local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local HeaderBar = require(Parent.UIBlox).App.Bar.HeaderBar
local IconButton = FoundationModule.IconButton
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local AgentSpecDebugSheetModule = require(BuildExperience.Components.AgentSpecDebug.AgentSpecDebugSheet)
local FlyoutSidePanelIXP = require(Parent.SharedExperimentDefinition).FlyoutSidePanelIXP
local FlyoutLeftHeader = require(Parent.FlyoutSidePanel).Components.FlyoutLeftHeader
local FFlagEnableHomeRobloxLogo = require(Parent.SharedFlags).FFlagEnableHomeRobloxLogo

local function renderFlyoutLeftHeader()
	-- upvalues: ReactModule (copy), FlyoutLeftHeader (copy), FFlagEnableHomeRobloxLogo (copy), FlyoutSidePanelIXP (copy)
	return ReactModule.createElement(FlyoutLeftHeader, {
		titleText = "Build",
		isRobloxLogoEnabled = false,
		isFlyoutEntrypointEnabled = if FFlagEnableHomeRobloxLogo then FlyoutSidePanelIXP.isFlyoutSidePanelEnabled() else nil,
		isAlternateEntryPointEnabled = FlyoutSidePanelIXP.isAlternateEntryPointEnabled()
	})
end

return function(Frame)
	-- upvalues: FlyoutSidePanelIXP (copy), ReactModule (copy), CreatorAgentChatModule (copy), IconButton (copy), IconName (copy), ButtonVariant (copy), InputSize (copy), View (copy), HeaderBar (copy), renderFlyoutLeftHeader (copy), AgentSpecDebugSheetModule (copy)
	local IsFlyoutSidePanelEnabled = FlyoutSidePanelIXP.isFlyoutSidePanelEnabled()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	return ReactModule.createElement(View, {
		ZIndex = 3,
		tag = "composition-content-header size-full-0 auto-y",
		testId = "BuildPageHeader",
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.new(1, 0, 0, Frame.height)
	}, {
		HeaderBar = ReactModule.createElement(HeaderBar, {
			isTitleCentered = false,
			barHeight = Frame.height,
			paddingLeft = UDim.new(0, 0),
			paddingRight = UDim.new(0, 0),
			renderLeft = if IsFlyoutSidePanelEnabled then renderFlyoutLeftHeader else nil,
			title = if IsFlyoutSidePanelEnabled then nil else "Build",
			renderRight = if CreatorAgentChatModule.experimentOverride.isEnabled() then function()
				-- upvalues: ReactModule (upval), IconButton (upval), IconName (upval), ButtonVariant (upval), InputSize (upval), UseStateResult2 (copy)
				return ReactModule.createElement(IconButton, {
					isCircular = true,
					icon = IconName.LabBeaker,
					variant = ButtonVariant.Utility,
					size = InputSize.Medium,
					onActivated = function()
						-- upvalues: UseStateResult2 (upval)
						UseStateResult2(true)
					end
				})
			end else nil
		}),
		AgentSpecSheet = if UseStateResult then ReactModule.createElement(AgentSpecDebugSheetModule, {
			onClose = function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(false)
			end
		}) else nil
	})
end
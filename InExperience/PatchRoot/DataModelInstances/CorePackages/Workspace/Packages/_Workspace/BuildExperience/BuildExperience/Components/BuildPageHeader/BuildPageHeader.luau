local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local headerBar = require(parent.UIBlox).App.Bar.HeaderBar
local iconButton = foundationModule.IconButton
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local agentSpecDebugSheetModule = require(buildExperience.Components.AgentSpecDebug.AgentSpecDebugSheet)
local flyoutSidePanelIXP = require(parent.SharedExperimentDefinition).FlyoutSidePanelIXP
local flyoutLeftHeader = require(parent.FlyoutSidePanel).Components.FlyoutLeftHeader
local fFlagEnableHomeRobloxLogo = require(parent.SharedFlags).FFlagEnableHomeRobloxLogo

local function renderFlyoutLeftHeader() --[[ line: 28 ]]
	-- upvalues: reactModule (ref), flyoutLeftHeader (ref), localizationStringsModule (ref), fFlagEnableHomeRobloxLogo (ref), flyoutSidePanelIXP (ref)
	return reactModule.createElement(flyoutLeftHeader, {
		isRobloxLogoEnabled = false,
		titleText = localizationStringsModule.BUILD_HEADER_TITLE,
		isFlyoutEntrypointEnabled = if fFlagEnableHomeRobloxLogo then flyoutSidePanelIXP.isFlyoutSidePanelEnabled() else nil,
		isAlternateEntryPointEnabled = flyoutSidePanelIXP.isAlternateEntryPointEnabled()
	})
end

return function(p0) --[[ line: 39 | named "BuildPageHeader" ]]
	-- upvalues: flyoutSidePanelIXP (ref), reactModule (ref), creatorAgentChatModule (ref), iconButton (ref), iconName (ref), buttonVariant (ref), inputSize (ref), view (ref), headerBar (ref), renderFlyoutLeftHeader (ref), localizationStringsModule (ref), agentSpecDebugSheetModule (ref)
	local var7 = flyoutSidePanelIXP.isFlyoutSidePanelEnabled()
	local var8, var9 = reactModule.useState(false)
	
	return reactModule.createElement(view, {
		ZIndex = 3,
		tag = "composition-content-header size-full-0 auto-y",
		testId = "BuildPageHeader",
		LayoutOrder = p0.LayoutOrder,
		Size = UDim2.new(1, 0, 0, p0.height)
	}, {
		HeaderBar = reactModule.createElement(headerBar, {
			isTitleCentered = false,
			barHeight = p0.height,
			paddingLeft = UDim.new(0, 0),
			paddingRight = UDim.new(0, 0),
			renderLeft = if var7 then renderFlyoutLeftHeader else nil,
			title = if var7 then nil else localizationStringsModule.BUILD_HEADER_TITLE,
			renderRight = if creatorAgentChatModule.experimentOverride.isEnabled() then function() --[[ line: 44 ]]
				-- upvalues: reactModule (copy), iconButton (copy), iconName (copy), buttonVariant (copy), inputSize (copy), var9 (ref)
				return reactModule.createElement(iconButton, {
					isCircular = true,
					icon = iconName.LabBeaker,
					variant = buttonVariant.Utility,
					size = inputSize.Medium,
					onActivated = function() --[[ line: 50 ]]
						-- upvalues: var9 (copy)
						var9(true)
					end
				})
			end else nil
		}),
		AgentSpecSheet = if var8 then reactModule.createElement(agentSpecDebugSheetModule, {
			onClose = function() --[[ line: 75 ]]
				-- upvalues: var9 (ref)
				var9(false)
			end
		}) else nil
	})
end
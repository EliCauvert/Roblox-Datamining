local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local UIBloxModule = require(parent.UIBlox)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local fFlagEnableHomeRobloxLogo = sharedFlagsModule.FFlagEnableHomeRobloxLogo
local headerBar = UIBloxModule.App.Bar.HeaderBar
local iconButton = foundationModule.IconButton
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local iconVariant = foundationModule.Enums.IconVariant
local inputSize = foundationModule.Enums.InputSize
local agentSpecDebugSheetModule = require(buildExperience.Components.AgentSpecDebug.AgentSpecDebugSheet)
local flyoutSidePanelIXP = require(parent.SharedExperimentDefinition).FlyoutSidePanelIXP
local flyoutLeftHeader = require(parent.FlyoutSidePanel).Components.FlyoutLeftHeader

local function renderFlyoutLeftHeader(p0) --[[ line: 33 ]]
	-- upvalues: reactModule (ref), flyoutLeftHeader (ref), fFlagBuildLocalization (ref), localizationStringsModule (ref), fFlagEnableHomeRobloxLogo (ref), flyoutSidePanelIXP (ref)
	return reactModule.createElement(flyoutLeftHeader, {
		isRobloxLogoEnabled = false,
		titleText = if fFlagBuildLocalization then p0 else localizationStringsModule.BUILD_HEADER_TITLE,
		isFlyoutEntrypointEnabled = if fFlagEnableHomeRobloxLogo then flyoutSidePanelIXP.isFlyoutSidePanelEnabled() else nil,
		isAlternateEntryPointEnabled = flyoutSidePanelIXP.isAlternateEntryPointEnabled()
	})
end

return function(p1) --[[ line: 44 | named "BuildPageHeader" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), flyoutSidePanelIXP (ref), reactModule (ref), creatorAgentChatModule (ref), iconButton (ref), iconName (ref), iconVariant (ref), buttonVariant (ref), inputSize (ref), view (ref), headerBar (ref), renderFlyoutLeftHeader (ref), agentSpecDebugSheetModule (ref)
	local var9 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({ title = localizationStringsModule.BUILD_HEADER_TITLE }) else nil).title else localizationStringsModule.BUILD_HEADER_TITLE
	local var10 = flyoutSidePanelIXP.isFlyoutSidePanelEnabled()
	local var11, var12 = reactModule.useState(false)
	
	return reactModule.createElement(view, {
		ZIndex = 3,
		tag = "composition-content-header size-full-0 auto-y",
		testId = "BuildPageHeader",
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.new(1, 0, 0, p1.height)
	}, {
		HeaderBar = reactModule.createElement(headerBar, {
			isTitleCentered = false,
			barHeight = p1.height,
			paddingLeft = UDim.new(0, 0),
			paddingRight = UDim.new(0, 0),
			renderLeft = if var10 then if fFlagBuildLocalization then function() --[[ line: 87 ]]
				-- upvalues: renderFlyoutLeftHeader (copy), var9 (ref)
				return renderFlyoutLeftHeader(var9)
			end else renderFlyoutLeftHeader else nil,
			title = if var10 then nil else var9,
			renderRight = if creatorAgentChatModule.experimentOverride.isEnabled() then function() --[[ line: 55 ]]
				-- upvalues: reactModule (copy), iconButton (copy), iconName (copy), creatorAgentChatModule (copy), iconVariant (copy), buttonVariant (copy), inputSize (copy), var12 (ref)
				return reactModule.createElement(iconButton, {
					isCircular = true,
					icon = {
						name = iconName.LabBeaker,
						variant = if creatorAgentChatModule.experimentOverride.get() ~= nil then iconVariant.Regular else iconVariant.Filled
					},
					variant = buttonVariant.Utility,
					size = inputSize.Medium,
					onActivated = function() --[[ line: 66 ]]
						-- upvalues: var12 (copy)
						var12(true)
					end
				})
			end else nil
		}),
		AgentSpecSheet = if var11 then reactModule.createElement(agentSpecDebugSheetModule, {
			onClose = function() --[[ line: 97 ]]
				-- upvalues: var12 (ref)
				var12(false)
			end
		}) else nil
	})
end
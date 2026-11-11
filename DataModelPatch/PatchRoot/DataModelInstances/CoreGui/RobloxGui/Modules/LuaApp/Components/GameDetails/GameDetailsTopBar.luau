local CorePackages = game:GetService("CorePackages")
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local FFlagSignalsNavP3fGameDetails = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3fGameDetails
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local RoactModule = require(CorePackages.Packages.Roact)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3fGameDetails then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local NavigateBackFunction = require(CorePackages.Workspace.Packages.NavigationRodux).Thunks.NavigateBack
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local WithStyleFunction = UIBloxModule.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Constants)
local Images = UIBloxModule.App.ImageSet.Images
local GameDetailsTopBar = RoactModule.PureComponent:extend("GameDetailsTopBar")
local GameDetailsTopBarInputSinkFix = game:DefineFastFlag("GameDetailsTopBarInputSinkFix", false)

local function getNumberOfGameDetailsPages(History): number
	-- upvalues: AppPage (copy)
	local HistoryEntry = History[#History]
	local Count = 0
	
	for i = 1, #HistoryEntry do
		if HistoryEntry[i].name == AppPage.GameDetail then
			Count += 1
			
			if Count > 1 then break end
		else
			continue
		end
	end
	return Count
end

function GameDetailsTopBar.init(p1)
	-- upvalues: getNumberOfGameDetailsPages (copy)
	function p1.onNavigationButtonActivated()
		-- upvalues: p1 (copy), getNumberOfGameDetailsPages (upval)
		if p1.isMounted then
			if getNumberOfGameDetailsPages(p1.props.history) <= 1 and p1.props.onCloseButtonActivated ~= nil then
				p1.props.onCloseButtonActivated({ backButtonNavigation = true })
				
				return
			end
			p1.props.navigateBack()
		end
	end
	
	function p1.onCloseButtonActivated()
		-- upvalues: p1 (copy)
		if p1.isMounted and p1.props.onCloseButtonActivated ~= nil then
			p1.props.onCloseButtonActivated()
		end
	end
end

function GameDetailsTopBar.didMount(p1)
	p1.isMounted = true
end

function GameDetailsTopBar.willUnmount(p1)
	p1.isMounted = false
end

function GameDetailsTopBar.render(p1)
	-- upvalues: ConstantsModule (copy), RoactModule (copy), WithStyleFunction (copy), GameDetailsTopBarInputSinkFix (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ImageSetLabel (copy), Images (copy)
	local StatusBarHeight = p1.props.statusBarHeight
	local NewStatusBarHeight = StatusBarHeight + ConstantsModule.NAV_BAR_SIZE
	local ShowCloseIcon = p1.props.showCloseIcon
	local TransitionPercentBinding = p1.props.transitionPercentBinding or RoactModule.createBinding(1)
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), NewStatusBarHeight (copy), GameDetailsTopBarInputSinkFix (upval), StatusBarHeight (copy), TransitionPercentBinding (copy), FFlagRenameDeprecatedUIBloxTokens (upval), p1 (copy), ShowCloseIcon (copy), ImageSetLabel (upval), Images (upval)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 0, NewStatusBarHeight),
			Active = if GameDetailsTopBarInputSinkFix then true else false
		}, {
			LeftNavigationButton = RoactModule.createElement("TextButton", {
				Position = UDim2.new(0, 15, 0, StatusBarHeight),
				Size = UDim2.new(0, 40, 0, 40),
				BorderSizePixel = 0,
				BackgroundTransparency = TransitionPercentBinding:map(function(p3: number): number
					return 1 - p3 + 0.3
				end),
				BackgroundColor3 = (if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Color.Surface.Surface_0 else p2.Tokens.Semantic.Color.Background.Default).Color3,
				Text = "",
				[RoactModule.Event.Activated] = p1.onNavigationButtonActivated
			}, {
				UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
				LeftCloseButton = ShowCloseIcon and RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 24, 0, 24),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = Images["icons/navigation/close"],
					ImageColor3 = p2.Theme.IconEmphasis.Color,
					ImageTransparency = TransitionPercentBinding:map(function(p3: number): number
						return 1 - p3
					end)
				}) or nil,
				LeftNavigationButton = if ShowCloseIcon then nil else RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 30, 0, 30),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = Images["icons/actions/cycleLeft"],
					ImageColor3 = p2.Theme.SystemPrimaryDefault.Color,
					ImageTransparency = TransitionPercentBinding:map(function(p3: number): number
						return 1 - p3
					end)
				}) or nil
			})
		})
	end)
end

local function _(p1): boolean
	-- upvalues: getNumberOfGameDetailsPages (copy)
	return getNumberOfGameDetailsPages(p1) <= 1
end

local v1 = if FFlagSignalsNavP3fGameDetails then function(p1)
	-- upvalues: GetLegacyNavigationStore (copy), UseSignalState (copy), getNumberOfGameDetailsPages (copy), RoactModule (copy), v1 (copy), CryoModule (copy)
	local History = UseSignalState(GetLegacyNavigationStore(false).getHistory)
	
	return RoactModule.createElement(v1, CryoModule.Dictionary.union(p1, {
		history = History,
		showCloseIcon = if p1.showCloseIcon == nil then getNumberOfGameDetailsPages(History) <= 1 else p1.showCloseIcon
	}))
end else RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: FFlagSignalsNavP3fGameDetails (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), getNumberOfGameDetailsPages (copy)
	local SelectLegacyHistoryResult = nil
	local ShowCloseIcon = nil
	
	if not FFlagSignalsNavP3fGameDetails then
		SelectLegacyHistoryResult = if FFlagUseNavigationSelectors then Selectors.selectLegacyHistory(p1) else p1.Navigation.history
		ShowCloseIcon = if p2.showCloseIcon == nil then getNumberOfGameDetailsPages(SelectLegacyHistoryResult) <= 1 else p2.showCloseIcon
	end
	return {
		statusBarHeight = p1.TopBar.statusBarHeight,
		showCloseIcon = ShowCloseIcon,
		history = SelectLegacyHistoryResult
	}
end, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy)
	return {
		navigateBack = function()
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateBackFunction (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.back() else Callback(NavigateBackFunction())
		end
	}
end)(GameDetailsTopBar)

return v1
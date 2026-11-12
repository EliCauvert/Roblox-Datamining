local Players = game:GetService("Players")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ConfigModule = require(ExpChat.Config)
local ReactModule = require(Parent.React)
local Dictionary = require(Parent.llama).Dictionary
local UIBloxModule = require(Parent.UIBlox)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local SharedFlagsModule = require(Parent.SharedFlags)
local ChannelTabDisplayLabel = ExpChatSharedModule.ChannelTabDisplayLabel
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local Interactable = UIBloxModule.Core.Control.Interactable
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local FFlagExpChatChannelTabSizingUpdateModule = require(ExpChat.Flags.FFlagExpChatChannelTabSizingUpdate)
local FFlagExpChatEnableFriendsTab = SharedFlagsModule.FFlagExpChatEnableFriendsTab
local FFlagExpChatUseSharedChannelTabDisplayLabel = SharedFlagsModule.FFlagExpChatUseSharedChannelTabDisplayLabel
local TextService = if FFlagExpChatChannelTabSizingUpdateModule then game:GetService("TextService") else nil
local LocalizationModule = require(ExpChat.Localization)
local GetOtherDisplayNameInWhisperChannelModule = require(ExpChat.getOtherDisplayNameInWhisperChannel)
local GetUnreadIndicatorLayoutModule = require(script.Parent.getUnreadIndicatorLayout)
local UseTabImpressionModule = require(script.Parent.useTabImpression)
local FFlagExpChatGlobalTabDefaultModule = require(ExpChat.Flags.FFlagExpChatGlobalTabDefault)
local UnreachableFunction = ExpChatSharedModule.TabTypes.unreachable
local Offset: number = if FFlagExpChatChannelTabSizingUpdateModule then 12 else 20
local _Color3 = Color3.fromRGB(255, 255, 255)
local config = {
	channelName = "",
	hasUnreadMessages = false,
	isDividerVisible = false,
	isTabCollapsed = false,
	isTabSelected = false,
	tabIndex = 1,
	isTabVisibleToUser = true,
	isLayoutReady = true,
	onTabSelected = nil,
	setTransparency = nil
}

local function createUnreadDot(Position, SetTransparencyResult)
	-- upvalues: ReactModule (copy), ConfigModule (copy)
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0, 8, 0, 8),
		Position = Position,
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundColor3 = ConfigModule.ChannelTabsSettings.UnreadDotColor3,
		BackgroundTransparency = SetTransparencyResult
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
	})
end

return function(p1)
	-- upvalues: Dictionary (copy), config (copy), UseTabImpressionModule (copy), FFlagExpChatGlobalTabDefaultModule (copy), LocalizationModule (copy), FFlagExpChatUseSharedChannelTabDisplayLabel (copy), ChannelTabDisplayLabel (copy), FFlagExpChatEnableFriendsTab (copy), UnreachableFunction (copy), Players (copy), GetOtherDisplayNameInWhisperChannelModule (copy), ReactModule (copy), UseSelectionCursorFunction (copy), CursorKind (copy), FFlagExpChatChannelTabSizingUpdateModule (copy), TextService (copy), GetUnreadIndicatorLayoutModule (copy), Offset (copy), Interactable (copy), createUnreadDot (copy), _Color3 (copy), ConfigModule (copy)
	local JoinResult = Dictionary.join(config, p1)
	UseTabImpressionModule({
		enabled = JoinResult.isLayoutReady,
		name = JoinResult.channelName,
		tabType = JoinResult.tabType,
		index = JoinResult.tabIndex,
		inOverflow = JoinResult.isTabCollapsed,
		visible = JoinResult.isTabVisibleToUser,
		hasUnreadMessages = JoinResult.hasUnreadMessages,
		isSelected = if FFlagExpChatGlobalTabDefaultModule then JoinResult.isTabSelected else nil
	})
	local UseLocalizationResult = LocalizationModule.useLocalization(if FFlagExpChatUseSharedChannelTabDisplayLabel then ChannelTabDisplayLabel.LocalizationKeys else {
		yourServer = "CoreScripts.TextChat.ChannelTabs.Here",
		moreServers = "CoreScripts.TextChat.ChannelTabs.Global2",
		friends = "CoreScripts.TextChat.ChannelTabs.Friends",
		system = "CoreScripts.TextChat.ChannelTabs.System",
		team = "CoreScripts.TextChat.ChannelTabs.Team"
	})
	local TabType = JoinResult.tabType
	local ChannelName = JoinResult.channelName
	
	if FFlagExpChatUseSharedChannelTabDisplayLabel then
		if TabType == "FriendsChat" and not FFlagExpChatEnableFriendsTab then
			UnreachableFunction(TabType)
		end
		ChannelName = ChannelTabDisplayLabel.getDisplayLabel(TabType, JoinResult.channelName, JoinResult.textChannel, Players.LocalPlayer, UseLocalizationResult)
	elseif TabType == "TextChat" then
		local ChannelName1: string = JoinResult.channelName
		
		if string.find(ChannelName1, "RBXGeneral") then
			ChannelName = UseLocalizationResult.yourServer
		elseif string.find(ChannelName1, "RBXSystem") then
			ChannelName = UseLocalizationResult.system
		elseif string.find(ChannelName1, "^RBXTeam") then
			ChannelName = UseLocalizationResult.team
		elseif string.find(ChannelName1, "^RBXWhisper") and JoinResult.textChannel and Players.LocalPlayer then
			local OtherDisplayNameInWhisperChannelModule = GetOtherDisplayNameInWhisperChannelModule(JoinResult.textChannel, Players.LocalPlayer)
			
			if OtherDisplayNameInWhisperChannelModule then
				ChannelName = OtherDisplayNameInWhisperChannelModule
			end
		end
	elseif TabType == "UniverseChat" then
		if string.find(JoinResult.channelName, "RBXGlobal") then
			ChannelName = UseLocalizationResult.moreServers
		end
	elseif FFlagExpChatEnableFriendsTab and TabType == "FriendsChat" then
		ChannelName = UseLocalizationResult.friends
	else
		UnreachableFunction(TabType)
	end
	local Text = ChannelName
	local UseStateResult, UseStateResult2 = ReactModule.useState(JoinResult.channelTabsSettings.BackgroundColor3)
	local UseSelectionCursorResult = UseSelectionCursorFunction(CursorKind.RoundedSlot)
	local NoIsTabCollapsed: boolean = FFlagExpChatChannelTabSizingUpdateModule and (JoinResult.hasUnreadMessages and not JoinResult.isTabCollapsed)
	local v1: ((any) -> ())? = nil
	local MapResult = nil
	local MapResult1 = nil
	
	if FFlagExpChatChannelTabSizingUpdateModule then
		local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(nil)
		local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(nil)
		
		v1 = function(Frame)
			-- upvalues: UseBindingResult2_1 (copy)
			UseBindingResult2_1(Frame.AbsoluteSize.X)
		end
		
		ReactModule.useEffect(function()
			-- upvalues: UseBindingResult2 (copy), JoinResult (copy), Text (copy), TextService (upval)
			UseBindingResult2(nil)
			
			if not JoinResult.hasUnreadMessages or JoinResult.isTabCollapsed then return end
			local Flag = false
			task.spawn(function()
				-- upvalues: Text (upval), JoinResult (upval), TextService (upval), Flag (ref), UseBindingResult2 (upval)
				local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
				GetTextBoundsParams.Text = Text
				GetTextBoundsParams.Font = JoinResult.channelTabsSettings.FontFace
				GetTextBoundsParams.Size = JoinResult.channelTabsSettings.TextSize
				GetTextBoundsParams.Width = 1e999
				local Success, Result = pcall(function()
					-- upvalues: TextService (upval), GetTextBoundsParams (copy)
					return TextService:GetTextBoundsAsync(GetTextBoundsParams)
				end)
				
				if Success and not Flag then
					UseBindingResult2((math.ceil(Result.X)))
				end
			end)
			
			return function()
				-- upvalues: Flag (ref)
				Flag = true
			end
		end, {
			JoinResult.channelTabsSettings.FontFace,
			JoinResult.channelTabsSettings.TextSize,
			JoinResult.hasUnreadMessages,
			JoinResult.isTabCollapsed,
			Text
		})
		
		if NoIsTabCollapsed then
			local MapResult2 = ReactModule.joinBindings({
				naturalTextWidth = UseBindingResult,
				tabWidth = UseBindingResult1
			}):map(function(p2)
				-- upvalues: GetUnreadIndicatorLayoutModule (upval), JoinResult (copy), Offset (upval)
				return GetUnreadIndicatorLayoutModule(JoinResult.hasUnreadMessages, JoinResult.isTabCollapsed, p2.tabWidth, p2.naturalTextWidth, Offset, 8, 8)
			end)
			MapResult = MapResult2:map(function(p2): UDim2
				-- upvalues: Offset (upval)
				return if p2 then UDim2.new(0, p2.textWidth, 1, 0) else UDim2.new(1, -(Offset * 2 + 8 + 8), 1, 0)
			end)
			MapResult1 = MapResult2:map(function(p2): UDim2
				-- upvalues: Offset (upval)
				return if p2 then UDim2.fromOffset(p2.textLeft, 0) else UDim2.fromOffset(Offset + 8 + 8, 0)
			end)
		end
	end
	return ReactModule.createElement(Interactable, {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = JoinResult.isTabCollapsed and JoinResult.setTransparency(JoinResult.channelTabsSettings.BackgroundTransparency) or 1,
		BackgroundColor3 = JoinResult.isTabCollapsed and UseStateResult or JoinResult.channelTabsSettings.BackgroundColor3,
		BorderSizePixel = 0,
		ref = JoinResult.tabRef,
		SelectionImageObject = UseSelectionCursorResult,
		onStateChanged = function() end,
		[ReactModule.Change.AbsoluteSize] = v1,
		[ReactModule.Event.Activated] = JoinResult.onTabSelected,
		[ReactModule.Event.MouseEnter] = function()
			-- upvalues: JoinResult (copy), UseStateResult2 (copy)
			if JoinResult.isTabCollapsed then
				UseStateResult2(JoinResult.channelTabsSettings.HoverBackgroundColor3)
			end
		end,
		[ReactModule.Event.MouseLeave] = function()
			-- upvalues: JoinResult (copy), UseStateResult2 (copy)
			if JoinResult.isTabCollapsed then
				UseStateResult2(JoinResult.channelTabsSettings.BackgroundColor3)
			end
		end
	}, {
		TextLabel = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = MapResult or UDim2.fromScale(1, 1),
			Position = MapResult1,
			Text = Text,
			FontFace = JoinResult.channelTabsSettings.FontFace,
			TextSize = JoinResult.channelTabsSettings.TextSize,
			TextColor3 = JoinResult.isTabSelected and JoinResult.channelTabsSettings.SelectedTabTextColor3 or JoinResult.channelTabsSettings.TextColor3,
			TextTransparency = JoinResult.setTransparency(0),
			TextStrokeColor3 = JoinResult.channelTabsSettings.TextStrokeColor3,
			TextStrokeTransparency = JoinResult.setTransparency(JoinResult.channelTabsSettings.TextStrokeTransparency),
			TextXAlignment = if NoIsTabCollapsed then Enum.TextXAlignment.Left elseif JoinResult.isTabCollapsed then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextTruncate = Enum.TextTruncate.AtEnd
		}, {
			UIPadding = if NoIsTabCollapsed then nil else ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, Offset + (if JoinResult.isTabCollapsed then 4 else 0)),
				PaddingRight = UDim.new(0, Offset)
			}),
			UnreadDot = NoIsTabCollapsed and createUnreadDot(UDim2.new(0, -8, 0.5, 0), JoinResult.setTransparency(0))
		}),
		UnreadDot = JoinResult.hasUnreadMessages and (not NoIsTabCollapsed and createUnreadDot(UDim2.new(0, Offset - 2, 0.5, 0), JoinResult.setTransparency(0))),
		Highlight = JoinResult.isTabSelected and ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 4),
			Position = UDim2.new(0, 0, 1, -4),
			BackgroundColor3 = _Color3,
			BackgroundTransparency = JoinResult.setTransparency(0)
		}),
		Divider = JoinResult.isDividerVisible and ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = JoinResult.isTabCollapsed and Vector2.new(0, 1) or Vector2.new(0, 0.5),
			Position = JoinResult.isTabCollapsed and UDim2.fromScale(0, 1) or UDim2.fromScale(1, 0.5),
			Size = JoinResult.isTabCollapsed and UDim2.new(1, 0, 0, ConfigModule.ChannelTabsSettings.DividerSize) or UDim2.new(0, ConfigModule.ChannelTabsSettings.DividerSize, 0.8, 0),
			BackgroundTransparency = JoinResult.setTransparency(ConfigModule.ChannelTabsSettings.DividerTransparency),
			BackgroundColor3 = ConfigModule.ChannelTabsSettings.DividerColor3
		})
	})
end
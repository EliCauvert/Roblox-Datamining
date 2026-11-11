local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseInterpolatedClientSettingsModule = require(Parent.ExpChatIntegration.useInterpolatedClientSettings)
local UseChatWindowSettingsModule = require(Parent.ExpChatIntegration.useChatWindowSettings)
local FriendsChatFacePileModule = require(script.Parent.FriendsChatFacePile)
local View = FoundationModule.View
local IconButton = FoundationModule.IconButton
local IconName = FoundationModule.Enums.IconName
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonSize = FoundationModule.Enums.ButtonSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NewResult = require(Parent.ExpChatShared).Logger:new(script.Name)

local function _(p1: number, p2)
	return if type(p2) == "number" then p1 + p2 * (1 - p1) elseif p2 == nil then p1 else p2:map(function(p3): number
		-- upvalues: p1 (copy)
		return p1 + p3 * (1 - p1)
	end)
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseChatWindowSettingsModule (copy), ReactModule (copy), UseInterpolatedClientSettingsModule (copy), NewResult (copy), View (copy), IconButton (copy), IconName (copy), ButtonVariant (copy), ButtonSize (copy), FriendsChatFacePileModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseChatWindowSettingsModuleResult = UseChatWindowSettingsModule()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseChatWindowSettingsModuleResult (copy)
		return {
			BackgroundColor3 = UseChatWindowSettingsModuleResult.ChatWindowBackgroundColor3,
			BackgroundTransparency = UseChatWindowSettingsModuleResult.ChatWindowBackgroundTransparency
		}
	end, { UseChatWindowSettingsModuleResult })
	local ChatWindowSettings = p1.chatWindowSettings
	local UseInterpolatedClientSettingsModuleResult = UseInterpolatedClientSettingsModule(ChatWindowSettings or UseMemoResult)
	local FontFace = if ChatWindowSettings then ChatWindowSettings.FontFace else nil
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: FontFace (copy), UseTokensResult (copy)
		if FontFace == nil then
			return nil
		else
			local Copy = table.clone(UseTokensResult.Typography.TitleMedium)
			Copy.Font = if typeof(FontFace) == "Font" then Font.new(FontFace.Family, Enum.FontWeight.Bold, FontFace.Style) else FontFace
			
			return { title = Copy }
		end
	end, { UseTokensResult, FontFace })
	local OnBackFunction = p1.onBack
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: NewResult (upval), OnBackFunction (copy)
		NewResult:info("Back button activated")
		
		if OnBackFunction then
			OnBackFunction()
		end
	end, { OnBackFunction })
	local CreateElementFunction = ReactModule.createElement
	local v1 = "Frame"
	local BackgroundTransparency: number = UseInterpolatedClientSettingsModuleResult.BackgroundTransparency
	local TransparencyValue = p1.transparencyValue
	local config = {
		BackgroundColor3 = UseInterpolatedClientSettingsModuleResult.BackgroundColor3 or UseTokensResult.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = if type(TransparencyValue) == "number" then BackgroundTransparency + TransparencyValue * (1 - BackgroundTransparency) elseif TransparencyValue == nil then BackgroundTransparency else TransparencyValue:map(function(p2): number
			-- upvalues: BackgroundTransparency (copy)
			return BackgroundTransparency + p2 * (1 - BackgroundTransparency)
		end),
		Active = true,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = p1.layoutOrder,
		[ReactModule.Event.MouseEnter] = p1.onHovered,
		[ReactModule.Event.MouseLeave] = p1.onUnhovered
	}
	local t = {}
	local CreateElementFunction1 = ReactModule.createElement
	local v2 = "CanvasGroup"
	local config1 = { BackgroundTransparency = 1, BorderSizePixel = 0 }
	local TransparencyValue1: number = p1.transparencyValue
	local NewTransparencyValue = nil
	
	if type(TransparencyValue1) == "number" then
		NewTransparencyValue = 0 + TransparencyValue1 * 1
	elseif TransparencyValue1 == nil then
		NewTransparencyValue = 0
	else
		local v3 = 0
		NewTransparencyValue = TransparencyValue1:map(function(p2): number
			-- upvalues: v3 (copy)
			return v3 + p2 * (1 - v3)
		end)
	end
	config1.GroupTransparency = NewTransparencyValue
	config1.AutomaticSize = Enum.AutomaticSize.Y
	config1.Size = UDim2.new(1, 0, 0, 0)
	t.Content = CreateElementFunction1(v2, config1, {
		Row = ReactModule.createElement(View, {
			tag = "row align-y-center gap-small size-full-0 auto-y padding-x-small padding-y-small"
		}, {
			BackButton = ReactModule.createElement(IconButton, {
				testId = "friends-chat-back-button",
				LayoutOrder = 1,
				icon = IconName.ChevronLargeLeft,
				variant = ButtonVariant.Utility,
				size = ButtonSize.XSmall,
				onActivated = UseResult
			}),
			FacePileContainer = ReactModule.createElement(View, { tag = "fill size-0-800", LayoutOrder = 2 }, {
				FacePile = ReactModule.createElement(FriendsChatFacePileModule, {
					participantUserIds = p1.participantUserIds,
					localUserId = p1.localUserId,
					titleText = p1.titleText,
					titleStyle = if UseMemoResult1 then UseMemoResult1.title else nil,
					onActivated = p1.onActivated,
					selectable = p1.onActivated ~= nil or nil
				})
			})
		})
	})
	
	return CreateElementFunction(v1, config, t)
end
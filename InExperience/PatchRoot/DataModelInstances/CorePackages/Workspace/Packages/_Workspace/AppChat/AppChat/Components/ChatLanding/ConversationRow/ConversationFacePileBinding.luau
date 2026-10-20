local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local DataHydrationModule = require(Parent.DataHydration)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagAppChatUseProfileFrameThumbnailModule = require(AppChat.Flags.FFlagAppChatUseProfileFrameThumbnail)
local FFlagAppChatBindingFacePileUserTileParityModule = require(AppChat.Flags.FFlagAppChatBindingFacePileUserTileParity)
local GetConversationStoreModule = require(AppChat.Stores.GetConversationStore)
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(Parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local Avatar = FoundationModule.Avatar
local AvatarSize = FoundationModule.Enums.AvatarSize
local Image = FoundationModule.Image
local View = FoundationModule.View
local UseCumulativeBackgroundFunction = FoundationModule.Hooks.useCumulativeBackground
local GetResult = DataHydrationModule.Presence.PresenceStore.get()
local PresenceType = DataHydrationModule.Presence.PresenceEnums.PresenceType

local function _(p1)
	if type(p1) == "table" then
		local Id = p1.id or p1.userId
		
		return if Id == nil then nil else tostring(Id)
	else
		return if p1 == nil then nil else tostring(p1)
	end
end

local function getParticipantIds(p1, p2)
	-- upvalues: GetConversationStoreModule (copy)
	local PresentationSignalResult = p1.presentationSignal(p2)
	local Text: string = if PresentationSignalResult.localUserId == nil then "" else tostring(PresentationSignalResult.localUserId)
	local Conversation = GetConversationStoreModule(false).getConversation(p1.id, p2)
	local T = if Conversation == nil or Conversation.participants == nil then {} else Conversation.participants
	local List = {}
	
	if #T == 1 then
		table.insert(List, Text)
		
		return List
	end
	for _, value in T do
		local Text1 = nil
		if type(value) == "table" then
			local Id = value.id or value.userId
			Text1 = if Id == nil then nil else tostring(Id)
		else
			Text1 = if value == nil then nil else tostring(value)
		end
		if Text1 ~= nil and Text1 ~= Text then
			table.insert(List, Text1)
		end
	end
	return List
end

local _ = function(p3, p4)
	-- upvalues: getParticipantIds (copy)
	local ParticipantIds = getParticipantIds(p3, p4)
	
	return {
		primary = ParticipantIds[1] or "",
		secondary = ParticipantIds[2]
	}
end

local function getHeadshotImage(UserId, HasSecondary, FFlagAppChatUseProfileFrameThumbnailModule)
	-- upvalues: GetStandardSizeAvatarHeadShotRbxthumbFunction (copy)
	return if HasSecondary and UserId ~= 0 then GetStandardSizeAvatarHeadShotRbxthumbFunction(tostring(UserId), FFlagAppChatUseProfileFrameThumbnailModule) else ""
end

return function(p3)
	-- upvalues: FoundationModule (copy), ReactModule (copy), getParticipantIds (copy), GetResult (copy), PresenceType (copy), SignalsReactModule (copy), FFlagAppChatBindingFacePileUserTileParityModule (copy), UseCumulativeBackgroundFunction (copy), Image (copy), getHeadshotImage (copy), FFlagAppChatUseProfileFrameThumbnailModule (copy), View (copy), Avatar (copy), AvatarSize (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local Shift300 = UseTokensResult.Color.Shift.Shift_300
	local UseResult = ReactModule.useCallback(function(p4, p5): number
		-- upvalues: getParticipantIds (upval)
		local ParticipantIds = getParticipantIds(p4, p5)
		
		return tonumber(({
			primary = ParticipantIds[1] or "",
			secondary = ParticipantIds[2]
		}).primary) or 0
	end, {})
	local UseResult1 = ReactModule.useCallback(function(p4, p5): number
		-- upvalues: getParticipantIds (upval)
		local ParticipantIds = getParticipantIds(p4, p5)
		
		return tonumber(({
			primary = ParticipantIds[1] or "",
			secondary = ParticipantIds[2]
		}).secondary) or 0
	end, {})
	local UseResult2 = ReactModule.useCallback(function(p4, p5): boolean
		-- upvalues: getParticipantIds (upval)
		local ParticipantIds = getParticipantIds(p4, p5)
		
		return ({
			primary = ParticipantIds[1] or "",
			secondary = ParticipantIds[2]
		}).secondary ~= nil
	end, {})
	local UseResult3 = ReactModule.useCallback(function(p4, p5): boolean
		-- upvalues: getParticipantIds (upval), GetResult (upval), PresenceType (upval)
		for _, value in getParticipantIds(p4, p5) do
			local DataResult = GetResult.GetPresenceByUserId(value).data(p5)
			
			if DataResult ~= nil then
				local UserPresenceType = DataResult.userPresenceType
				
				if UserPresenceType == PresenceType.InGame or UserPresenceType == PresenceType.InStudio or UserPresenceType == PresenceType.Online then
					return true
				end
			end
		end
		return false
	end, {})
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(function(p6)
		-- upvalues: UseResult (copy), p3 (copy)
		return UseResult(p3.itemSignal(p6), p6)
	end)
	local UseSignalBindingResult1 = SignalsReactModule.useSignalBinding(function(p6)
		-- upvalues: UseResult1 (copy), p3 (copy)
		return UseResult1(p3.itemSignal(p6), p6)
	end)
	local UseSignalBindingResult2 = SignalsReactModule.useSignalBinding(function(p6)
		-- upvalues: UseResult2 (copy), p3 (copy)
		return UseResult2(p3.itemSignal(p6), p6)
	end)
	local MapResult = UseSignalBindingResult2:map(function(p6): boolean
		return not p6
	end)
	local UseCumulativeBackgroundResult = if FFlagAppChatBindingFacePileUserTileParityModule then UseCumulativeBackgroundFunction(UseTokensResult.Color.Surface.Surface_0, Shift300) else nil
	local Element = ReactModule.createElement(Image, {
		Image = "component_assets/circle_16",
		ZIndex = 3,
		tag = "anchor-center-center radius-circle bg-surface-100",
		testId = "conversation-face-pile-presence",
		Position = UDim2.new(0.8536, UseTokensResult.Stroke.Thicker, 0.8536, UseTokensResult.Stroke.Thicker),
		Size = UDim2.new(0.125, 4, 0.125, 4),
		Visible = SignalsReactModule.useSignalBinding(function(p6)
			-- upvalues: UseResult3 (copy), p3 (copy)
			return UseResult3(p3.itemSignal(p6), p6)
		end),
		imageStyle = UseTokensResult.Color.System.Success,
		stroke = {
			Thickness = UseTokensResult.Stroke.Thicker,
			Color = UseTokensResult.Color.Surface.Surface_100.Color3
		}
	})
	
	if FFlagAppChatBindingFacePileUserTileParityModule then
		local JoinBindingsResult = ReactModule.joinBindings({
			userId = UseSignalBindingResult,
			hasSecondary = UseSignalBindingResult2
		})
		
		return ReactModule.createElement(View, {
			tag = "position-center-center anchor-center-center size-full"
		}, {
			Primary = ReactModule.createElement(View, {
				tag = "size-full",
				testId = "conversation-face-pile-primary",
				Visible = MapResult
			}, {
				Image = ReactModule.createElement(Image, {
					tag = "position-center-center anchor-center-center size-full aspect-1-1 radius-circle",
					testId = "conversation-face-pile-primary--image",
					backgroundStyle = Shift300,
					Image = JoinBindingsResult:map(function(p6)
						-- upvalues: getHeadshotImage (upval), FFlagAppChatUseProfileFrameThumbnailModule (upval)
						return getHeadshotImage(p6.userId, not p6.hasSecondary, FFlagAppChatUseProfileFrameThumbnailModule)
					end)
				})
			}),
			Group = ReactModule.createElement(View, {
				tag = "size-full",
				testId = "conversation-face-pile-group",
				Visible = UseSignalBindingResult2
			}, {
				Primary = ReactModule.createElement(Image, {
					tag = "position-bottom-left anchor-bottom-left aspect-1-1 radius-circle",
					testId = "conversation-face-pile-group-primary--image",
					ZIndex = 2,
					backgroundStyle = UseCumulativeBackgroundResult,
					Image = JoinBindingsResult:map(function(p6)
						-- upvalues: getHeadshotImage (upval)
						return getHeadshotImage(p6.userId, p6.hasSecondary)
					end),
					Size = UDim2.fromScale(0.7, 0.7)
				}),
				Secondary = ReactModule.createElement(Image, {
					tag = "position-top-right anchor-top-right aspect-1-1 radius-circle",
					testId = "conversation-face-pile-group-secondary--image",
					ZIndex = 1,
					backgroundStyle = UseCumulativeBackgroundResult,
					Image = ReactModule.joinBindings({
						userId = UseSignalBindingResult1,
						hasSecondary = UseSignalBindingResult2
					}):map(function(p6)
						-- upvalues: getHeadshotImage (upval)
						return getHeadshotImage(p6.userId, p6.hasSecondary)
					end),
					Size = UDim2.fromScale(0.7, 0.7)
				})
			}),
			Presence = Element
		})
	else
		return ReactModule.createElement(View, {
			tag = "position-center-center anchor-center-center size-full"
		}, {
			Primary = ReactModule.createElement(Avatar, {
				testId = "conversation-face-pile-primary",
				backgroundStyle = Shift300,
				includeProfileFrame = FFlagAppChatUseProfileFrameThumbnailModule,
				size = AvatarSize.Medium,
				userId = UseSignalBindingResult,
				Visible = MapResult
			}),
			Group = ReactModule.createElement(View, {
				tag = "size-full",
				testId = "conversation-face-pile-group",
				Visible = UseSignalBindingResult2
			}, {
				Primary = ReactModule.createElement(Avatar, {
					testId = "conversation-face-pile-group-primary",
					ZIndex = 2,
					AnchorPoint = Vector2.new(0, 1),
					backplateStyle = UseTokensResult.Color.Surface.Surface_0,
					backgroundStyle = Shift300,
					Position = UDim2.fromScale(0, 1),
					size = AvatarSize.Small,
					userId = UseSignalBindingResult
				}),
				Secondary = ReactModule.createElement(Avatar, {
					testId = "conversation-face-pile-group-secondary",
					ZIndex = 1,
					AnchorPoint = Vector2.new(1, 0),
					backplateStyle = UseTokensResult.Color.Surface.Surface_0,
					backgroundStyle = Shift300,
					Position = UDim2.fromScale(1, 0),
					size = AvatarSize.Small,
					userId = UseSignalBindingResult1
				})
			}),
			Presence = Element
		})
	end
end
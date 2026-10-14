local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local dataHydrationModule = require(parent.DataHydration)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local fFlagAppChatUseProfileFrameThumbnailModule = require(appChat.Flags.FFlagAppChatUseProfileFrameThumbnail)
local fFlagAppChatBindingFacePileUserTileParityModule = require(appChat.Flags.FFlagAppChatBindingFacePileUserTileParity)
local getConversationStoreModule = require(appChat.Stores.GetConversationStore)
local getStandardSizeAvatarHeadShotRbxthumb = require(parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local avatar = foundationModule.Avatar
local avatarSize = foundationModule.Enums.AvatarSize
local image = foundationModule.Image
local view = foundationModule.View
local useCumulativeBackground = foundationModule.Hooks.useCumulativeBackground
local var1 = dataHydrationModule.Presence.PresenceStore.get()
local presenceType = dataHydrationModule.Presence.PresenceEnums.PresenceType

local function _(p1)
	if type(p1) == "table" then
		local id = p1.id or p1.userId
		
		return if id == nil then nil else tostring(id)
	end
	return if p1 == nil then nil else tostring(p1)
end

local function getParticipantIds(p1, p2)
	-- upvalues: getConversationStoreModule (ref)
	local var2 = p1.presentationSignal(p2)
	local var3 = if var2.localUserId ~= nil then "" else tostring(var2.localUserId)
	local conversation = getConversationStoreModule(false).getConversation(p1.id, p2)
	local var4 = if conversation == nil or conversation.participants == nil then {} else conversation.participants
	local t = {}
	
	if #var4 == 1 then
		table.insert(t, var3)
		
		return t
	end
	for i, v in var4 do
		local var5
		if type(v) == "table" then
			local var6 = v.id or v.userId
			var5 = if var6 ~= nil then nil else tostring(var6)
		else
			var5 = if v ~= nil then nil else tostring(v)
		end
		if var5 ~= nil and var5 ~= var3 then
			table.insert(t, var5)
		end
	end
	return t
end

local _ = function(p3, p4)
	-- upvalues: getParticipantIds (ref)
	local var7 = getParticipantIds(p3, p4)
	
	return { primary = var7[1] or "", secondary = var7[2] }
end

local function getHeadshotImage(p3, p4, p5)
	-- upvalues: getStandardSizeAvatarHeadShotRbxthumb (ref)
	return if p4 and p3 ~= 0 then getStandardSizeAvatarHeadShotRbxthumb(tostring(p3), p5) else ""
end

return function(p3)
	-- upvalues: foundationModule (ref), reactModule (ref), getParticipantIds (ref), var1 (ref), presenceType (ref), signalsReactModule (ref), fFlagAppChatBindingFacePileUserTileParityModule (ref), useCumulativeBackground (ref), image (ref), getHeadshotImage (ref), fFlagAppChatUseProfileFrameThumbnailModule (ref), view (ref), avatar (ref), avatarSize (ref)
	local var7 = foundationModule.Hooks.useTokens()
	local shift300 = var7.Color.Shift.Shift_300
	local var8 = reactModule.useCallback(function(p4, p5)
		-- upvalues: getParticipantIds (copy)
		local var9 = getParticipantIds(p4, p5)
		
		return tonumber(({ primary = var9[1] or "", secondary = var9[2] }).primary) or 0
	end, {})
	local var9 = reactModule.useCallback(function(p4, p5)
		-- upvalues: getParticipantIds (copy)
		local var10 = getParticipantIds(p4, p5)
		
		return tonumber(({ primary = var10[1] or "", secondary = var10[2] }).secondary) or 0
	end, {})
	local var10 = reactModule.useCallback(function(p4, p5)
		-- upvalues: getParticipantIds (copy)
		local var11 = getParticipantIds(p4, p5)
		
		return ({ primary = var11[1] or "", secondary = var11[2] }).secondary ~= nil
	end, {})
	local var11 = reactModule.useCallback(function(p4, p5)
		-- upvalues: getParticipantIds (copy), var1 (copy), presenceType (copy)
		for i, v in getParticipantIds(p4, p5) do
			local var12 = var1.GetPresenceByUserId(v).data(p5)
			
			if var12 ~= nil then
				local userPresenceType = var12.userPresenceType
				
				if userPresenceType == presenceType.InGame or userPresenceType == presenceType.InStudio or userPresenceType == presenceType.Online then
					return true
				end
			end
		end
		return false
	end, {})
	local var13 = signalsReactModule.useSignalBinding(function(p6)
		-- upvalues: var8 (ref), p3 (ref)
		return var8(p3.itemSignal(p6), p6)
	end)
	local var14 = signalsReactModule.useSignalBinding(function(p6)
		-- upvalues: var9 (ref), p3 (ref)
		return var9(p3.itemSignal(p6), p6)
	end)
	local var15 = signalsReactModule.useSignalBinding(function(p6)
		-- upvalues: var10 (ref), p3 (ref)
		return var10(p3.itemSignal(p6), p6)
	end)
	local var16 = signalsReactModule.useSignalBinding(function(p6)
		-- upvalues: var11 (ref), p3 (ref)
		return var11(p3.itemSignal(p6), p6)
	end)
	local var17 = var15:map(function(p6)
		return not p6
	end)
	local var18 = if fFlagAppChatBindingFacePileUserTileParityModule then useCumulativeBackground(var7.Color.Surface.Surface_0, shift300) else nil
	local var19 = reactModule.createElement(image, {
		Image = "component_assets/circle_16",
		ZIndex = 3,
		tag = "anchor-center-center radius-circle bg-surface-100",
		testId = "conversation-face-pile-presence",
		Position = UDim2.new(0.8536, var7.Stroke.Thicker, 0.8536, var7.Stroke.Thicker),
		Size = UDim2.new(0.125, 4, 0.125, 4),
		Visible = var16,
		imageStyle = var7.Color.System.Success,
		stroke = {
			Thickness = var7.Stroke.Thicker,
			Color = var7.Color.Surface.Surface_100.Color3
		}
	})
	
	if fFlagAppChatBindingFacePileUserTileParityModule then
		local var20 = reactModule.joinBindings({ userId = var13, hasSecondary = var15 })
		
		return reactModule.createElement(view, {
			tag = "position-center-center anchor-center-center size-full"
		}, {
			Primary = reactModule.createElement(view, {
				tag = "size-full",
				testId = "conversation-face-pile-primary",
				Visible = var17
			}, {
				Image = reactModule.createElement(image, {
					tag = "position-center-center anchor-center-center size-full aspect-1-1 radius-circle",
					testId = "conversation-face-pile-primary--image",
					backgroundStyle = shift300,
					Image = var20:map(function(p6)
						-- upvalues: getHeadshotImage (copy), fFlagAppChatUseProfileFrameThumbnailModule (copy)
						return getHeadshotImage(p6.userId, not p6.hasSecondary, fFlagAppChatUseProfileFrameThumbnailModule)
					end)
				})
			}),
			Group = reactModule.createElement(view, {
				tag = "size-full",
				testId = "conversation-face-pile-group",
				Visible = var15
			}, {
				Primary = reactModule.createElement(image, {
					tag = "position-bottom-left anchor-bottom-left aspect-1-1 radius-circle",
					testId = "conversation-face-pile-group-primary--image",
					ZIndex = 2,
					backgroundStyle = var18,
					Image = var20:map(function(p6)
						-- upvalues: getHeadshotImage (copy)
						return getHeadshotImage(p6.userId, p6.hasSecondary)
					end),
					Size = UDim2.fromScale(0.7, 0.7)
				}),
				Secondary = reactModule.createElement(image, {
					tag = "position-top-right anchor-top-right aspect-1-1 radius-circle",
					testId = "conversation-face-pile-group-secondary--image",
					ZIndex = 1,
					backgroundStyle = var18,
					Image = reactModule.joinBindings({ userId = var14, hasSecondary = var15 }):map(function(p6)
						-- upvalues: getHeadshotImage (copy)
						return getHeadshotImage(p6.userId, p6.hasSecondary)
					end),
					Size = UDim2.fromScale(0.7, 0.7)
				})
			}),
			Presence = var19
		})
	end
	return reactModule.createElement(view, {
		tag = "position-center-center anchor-center-center size-full"
	}, {
		Primary = reactModule.createElement(avatar, {
			testId = "conversation-face-pile-primary",
			backgroundStyle = shift300,
			includeProfileFrame = fFlagAppChatUseProfileFrameThumbnailModule,
			size = avatarSize.Medium,
			userId = var13,
			Visible = var17
		}),
		Group = reactModule.createElement(view, {
			tag = "size-full",
			testId = "conversation-face-pile-group",
			Visible = var15
		}, {
			Primary = reactModule.createElement(avatar, {
				testId = "conversation-face-pile-group-primary",
				ZIndex = 2,
				AnchorPoint = Vector2.new(0, 1),
				backplateStyle = var7.Color.Surface.Surface_0,
				backgroundStyle = shift300,
				Position = UDim2.fromScale(0, 1),
				size = avatarSize.Small,
				userId = var13
			}),
			Secondary = reactModule.createElement(avatar, {
				testId = "conversation-face-pile-group-secondary",
				ZIndex = 1,
				AnchorPoint = Vector2.new(1, 0),
				backplateStyle = var7.Color.Surface.Surface_0,
				backgroundStyle = shift300,
				Position = UDim2.fromScale(1, 0),
				size = avatarSize.Small,
				userId = var14
			})
		}),
		Presence = var19
	})
end
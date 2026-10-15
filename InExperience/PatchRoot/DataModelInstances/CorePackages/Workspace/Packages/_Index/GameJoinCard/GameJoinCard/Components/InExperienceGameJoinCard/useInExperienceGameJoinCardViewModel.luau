local gameJoinCard = script:FindFirstAncestor("GameJoinCard")
local parent = gameJoinCard.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local dataHydrationModule = require(parent.DataHydration)
local userProfileStore = require(parent.UserProfiles.Stores).UserProfileStore
local useExperienceBannerImage = require(parent.GameDetail).useExperienceBannerImage
local userCtaAction = require(parent.UserCtaCommon).Enums.UserCtaAction
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(gameJoinCard.Components.Actions.Types)
local textKeysModule = require(gameJoinCard.Components.Actions.TextKeys)
local _ = require(gameJoinCard.Components.MobileGameJoinCard.MobileGameJoinCard)
local _ = require(script.Parent.Types)
local getRbxThumb = foundationModule.Utility.getRbxThumb
local thumbnailType = foundationModule.Enums.ThumbnailType
local thumbnailSize = foundationModule.Enums.ThumbnailSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local dataStatus = dataHydrationModule.DataStatus
local presenceType = dataHydrationModule.Presence.PresenceEnums.PresenceType
local var1 = dataHydrationModule.Presence.PresenceStore.get()
local var2 = userProfileStore.get()

local function noop() end

local function _(p1)
	-- upvalues: presenceType (ref)
	return p1 ~= nil and (p1.userPresenceType == presenceType.InGame and p1.universeId ~= "")
end

return function(p1)
	-- upvalues: reactModule (ref), signalsModule (ref), var1 (ref), dataStatus (ref), signalsReactModule (ref), presenceType (ref), var2 (ref), useExperienceBannerImage (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref), useLocalization (ref), textKeysModule (ref), userCtaAction (ref), buttonVariant (ref), inputSize (ref), noop (ref)
	local userId = p1.userId
	local onJoin = p1.onJoin
	local onClose = p1.onClose
	local var3 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var1 (copy), userId (ref), dataStatus (copy)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var1 (copy), userId (copy), dataStatus (copy)
			local presenceByUserId = var1.GetPresenceByUserId(userId)
			local var4 = presenceByUserId.data(p2)
			
			return {
				presence = var4,
				isLoading = var4 == nil and presenceByUserId.status(p2) == dataStatus.NotReady
			}
		end)
	end, { userId }))
	local presence = var3.presence
	local var4 = presence ~= nil and (presence.userPresenceType == presenceType.InGame and presence.universeId ~= "")
	local var5 = reactModule.useMemo(function()
		-- upvalues: var2 (copy), userId (ref)
		return var2.fetchNamesByUserIds({ userId })
	end, { userId })
	local var6 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var5 (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var5 (copy)
			local var7 = var5(p2)
			local var8 = var7 and (var7.data and var7.data[1])
			local var9 = if var8 and var8.names then var8.names.getCombinedName(p2) else ""
			
			return {
				name = var9,
				isLoading = var9 == "" and (var7 ~= nil and var7.status == "fetching")
			}
		end)
	end, { var5 }))
	local var7, var8 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var8 (ref), presence (ref)
		if var4 then
			var8(presence)
		end
	end, { presence, var4 })
	local var9 = if var4 then presence else var7
	local var10 = if var9 then var9.universeId else ""
	local var11 = useExperienceBannerImage(var10, if var9 and var9.rootPlaceId ~= "" then var9.rootPlaceId else nil)
	local var12 = if var10 ~= "" then nil else getRbxThumb(thumbnailType.GameIcon, var10, thumbnailSize.Medium)
	local var13 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), presence (ref), userId (ref)
		return if var4 and presence ~= nil then {
			userId = userId,
			placeId = presence.placeId,
			rootPlaceId = presence.rootPlaceId,
			universeId = presence.universeId
		} else nil
	end, { userId, presence, var4 })
	local var14 = reactModule.useRef(false)
	local var15 = reactModule.useCallback(function()
		-- upvalues: var14 (ref), var13 (ref), onJoin (ref), onClose (ref)
		if var14.current or var13 == nil then
			return
		end
		var14.current = true
		onJoin(var13)
		onClose()
	end, { var13, onJoin, onClose })
	local isLoading = var3.isLoading or var6.isLoading
	
	return {
		onViewProfile = nil,
		onViewExperienceDetails = nil,
		canUsePlatformChat = false,
		ageCheckRequired = false,
		areActionsLoading = false,
		disableAppTelemetry = true,
		onClose = onClose,
		onJoin = var15,
		userId = userId,
		universeId = var10,
		playerName = var6.name,
		experienceName = if var9 then var9.lastLocation else "",
		bannerImageUrl = var11.url,
		thumbnailImageUrl = var12,
		onChat = noop,
		isLoading = isLoading,
		isInExperience = var4,
		actions = {
			{
				keepOpenOnActivate = true,
				id = userCtaAction.JoinExperience,
				text = useLocalization({ join = textKeysModule[userCtaAction.JoinExperience] }).join,
				variant = buttonVariant.Emphasis,
				inputSize = inputSize.Medium,
				width = UDim.new(1, 0),
				isLoading = isLoading,
				isDisabled = not var4,
				onActivated = var15
			}
		}
	}
end
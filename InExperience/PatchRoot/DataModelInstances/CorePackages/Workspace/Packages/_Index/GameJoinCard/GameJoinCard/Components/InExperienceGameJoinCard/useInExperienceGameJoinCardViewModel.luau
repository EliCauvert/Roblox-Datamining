local GameJoinCard = script:FindFirstAncestor("GameJoinCard")
local Parent = GameJoinCard.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationModule = require(Parent.Foundation)
local DataHydrationModule = require(Parent.DataHydration)
local UseExperienceBannerImageFunction = require(Parent.GameDetail).useExperienceBannerImage
local UserCtaAction = require(Parent.UserCtaCommon).Enums.UserCtaAction
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(GameJoinCard.Components.Actions.Types)
local TextKeysModule = require(GameJoinCard.Components.Actions.TextKeys)
local _ = require(GameJoinCard.Components.MobileGameJoinCard.MobileGameJoinCard)
local _ = require(script.Parent.Types)
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local ThumbnailType = FoundationModule.Enums.ThumbnailType
local ThumbnailSize = FoundationModule.Enums.ThumbnailSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local DataStatus = DataHydrationModule.DataStatus
local PresenceType = DataHydrationModule.Presence.PresenceEnums.PresenceType
local GetResult = DataHydrationModule.Presence.PresenceStore.get()
local GetResult1 = require(Parent.UserProfiles.Stores).UserProfileStore.get()

local function noop() end

local function _(p1): boolean
	-- upvalues: PresenceType (copy)
	return p1 ~= nil and (p1.userPresenceType == PresenceType.InGame and p1.universeId ~= "")
end

return function(p1)
	-- upvalues: ReactModule (copy), SignalsModule (copy), GetResult (copy), DataStatus (copy), SignalsReactModule (copy), PresenceType (copy), GetResult1 (copy), UseExperienceBannerImageFunction (copy), GetRbxThumbFunction (copy), ThumbnailType (copy), ThumbnailSize (copy), UseLocalizationFunction (copy), TextKeysModule (copy), UserCtaAction (copy), ButtonVariant (copy), InputSize (copy), noop (copy)
	local UserId = p1.userId
	local OnJoinFunction = p1.onJoin
	local OnCloseFunction = p1.onClose
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), GetResult (upval), UserId (copy), DataStatus (upval)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: GetResult (upval), UserId (upval), DataStatus (upval)
			local PresenceByUserId = GetResult.GetPresenceByUserId(UserId)
			local DataResult = PresenceByUserId.data(p2)
			
			return {
				presence = DataResult,
				isLoading = DataResult == nil and PresenceByUserId.status(p2) == DataStatus.NotReady
			}
		end)
	end, { UserId })))
	local Presence = UseSignalStateResult.presence
	local IsNotUniverseIdMatch: boolean = Presence ~= nil and (Presence.userPresenceType == PresenceType.InGame and Presence.universeId ~= "")
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetResult1 (upval), UserId (copy)
		return GetResult1.fetchNamesByUserIds({ UserId })
	end, { UserId })
	local UseSignalStateResult1 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseMemoResult (copy)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: UseMemoResult (upval)
			local UseMemoResultResult = UseMemoResult(p2)
			local Entry = UseMemoResultResult and (UseMemoResultResult.data and UseMemoResultResult.data[1])
			local CombinedName = if Entry and Entry.names then Entry.names.getCombinedName(p2) else ""
			
			return {
				name = CombinedName,
				isLoading = CombinedName == "" and (UseMemoResultResult ~= nil and UseMemoResultResult.status == "fetching")
			}
		end)
	end, { UseMemoResult })))
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: IsNotUniverseIdMatch (copy), UseStateResult2 (copy), Presence (copy)
		if IsNotUniverseIdMatch then
			UseStateResult2(Presence)
		end
	end, { Presence, IsNotUniverseIdMatch })
	local Presence1 = if IsNotUniverseIdMatch then Presence else UseStateResult
	local UniverseId = if Presence1 then Presence1.universeId else ""
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: IsNotUniverseIdMatch (copy), Presence (copy), UserId (copy)
		return if IsNotUniverseIdMatch and Presence ~= nil then {
			userId = UserId,
			placeId = Presence.placeId,
			rootPlaceId = Presence.rootPlaceId,
			universeId = Presence.universeId
		} else nil
	end, { UserId, Presence, IsNotUniverseIdMatch })
	local UseRefResult = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseMemoResult1 (copy), OnJoinFunction (copy), OnCloseFunction (copy)
		if not UseRefResult.current and UseMemoResult1 ~= nil then
			UseRefResult.current = true
			OnJoinFunction(UseMemoResult1)
			OnCloseFunction()
			
			return
		end
	end, { UseMemoResult1, OnJoinFunction, OnCloseFunction })
	local IsLoading = UseSignalStateResult.isLoading or UseSignalStateResult1.isLoading
	
	return {
		onViewProfile = nil,
		onViewExperienceDetails = nil,
		canUsePlatformChat = false,
		ageCheckRequired = false,
		areActionsLoading = false,
		disableAppTelemetry = true,
		onClose = OnCloseFunction,
		onJoin = UseResult,
		userId = UserId,
		universeId = UniverseId,
		playerName = UseSignalStateResult1.name,
		experienceName = if Presence1 then Presence1.lastLocation else "",
		bannerImageUrl = UseExperienceBannerImageFunction(UniverseId, if Presence1 and Presence1.rootPlaceId ~= "" then Presence1.rootPlaceId else nil).url,
		thumbnailImageUrl = if UniverseId == "" then nil else GetRbxThumbFunction(ThumbnailType.GameIcon, UniverseId, ThumbnailSize.Medium),
		onChat = noop,
		isLoading = IsLoading,
		isInExperience = IsNotUniverseIdMatch,
		actions = {
			{
				keepOpenOnActivate = true,
				id = UserCtaAction.JoinExperience,
				text = UseLocalizationFunction({ join = TextKeysModule[UserCtaAction.JoinExperience] }).join,
				variant = ButtonVariant.Emphasis,
				inputSize = InputSize.Medium,
				width = UDim.new(1, 0),
				isLoading = IsLoading,
				isDisabled = not IsNotUniverseIdMatch,
				onActivated = UseResult
			}
		}
	}
end
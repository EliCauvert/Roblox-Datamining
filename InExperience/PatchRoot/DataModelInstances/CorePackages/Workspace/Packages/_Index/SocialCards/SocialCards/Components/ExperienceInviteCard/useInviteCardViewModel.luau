local Parent = script.Parent
local Parent1 = Parent:FindFirstAncestor("SocialCards").Parent
local ReactModule = require(Parent1.React)
local SignalsModule = require(Parent1.Signals)
local SignalsReactModule = require(Parent1.SignalsReact)
local GameGetGameInfoStoreModule = require(Parent1.DataHydration.GameGetGameInfoStore)
local GameGetPlayabilityStoreModule = require(Parent1.DataHydration.GameGetPlayabilityStore)
local TrimFunction = require(Parent1.LuauPolyfill).String.trim
local JoinInviteModule = require(Parent.joinInvite)
local ResolveInviteLinkModule = require(Parent.resolveInviteLink)
local InviteCardStatus = require(Parent.InviteTypes).InviteCardStatus
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local UseSignalBindingFunction = SignalsReactModule.useSignalBinding
local UseSignalStateFunction = SignalsReactModule.useSignalState

local function _(p1)
	-- upvalues: TrimFunction (copy)
	return if p1 == nil then "" else TrimFunction(string.match(TrimFunction(p1), "^[^\r\n]*") or "")
end

local function isSameExperience(p1, p2): boolean
	return p1.status == p2.status and (p1.name == p2.name and p1.description == p2.description) and p1.rootPlaceId == p2.rootPlaceId
end

local function isSamePlayability(p1, p2): boolean
	return p1.isPlayable == p2.isPlayable and p1.isLoading == p2.isLoading
end

local _ = function(p1): boolean
	return p1 ~= nil and (p1.rootPlaceId == nil and not p1.isUnavailable)
end

local function createGetters(Callback)
	-- upvalues: SignalsModule (copy), GameGetGameInfoStoreModule (copy), InviteCardStatus (copy), TrimFunction (copy), isSameExperience (copy), GameGetPlayabilityStoreModule (copy), isSamePlayability (copy)
	local Computed = SignalsModule.createComputed(function(p1)
		-- upvalues: Callback (copy)
		return Callback(p1).universeId
	end)
	local t = {}
	local Computed1 = SignalsModule.createComputed(function(p1)
		-- upvalues: Computed (copy), GameGetGameInfoStoreModule (upval), t (copy), InviteCardStatus (upval), TrimFunction (upval)
		local ComputedResult = Computed(p1)
		local AndFetchGameInfo = GameGetGameInfoStoreModule(p1).getAndFetchGameInfo(ComputedResult, function(p2): boolean
			-- upvalues: t (upval), ComputedResult (copy)
			if p2 ~= nil and (p2.rootPlaceId == nil and not p2.isUnavailable) and not t[ComputedResult] then
				t[ComputedResult] = true
				
				return true
			else
				return false
			end
		end)
		local DataResult = AndFetchGameInfo.data(p1)
		
		if DataResult and not DataResult.isUnavailable and DataResult.rootPlaceId then
			local Description = DataResult.description
			
			return {
				status = InviteCardStatus.Ready,
				name = DataResult.name or "",
				description = if Description == nil then "" else TrimFunction(string.match(TrimFunction(Description), "^[^\r\n]*") or ""),
				rootPlaceId = DataResult.rootPlaceId
			}
		else
			local StatusResult = AndFetchGameInfo.status(p1)
			local IsNotReady: boolean = if DataResult == nil then StatusResult == "NotReady" else DataResult ~= nil and (DataResult.rootPlaceId == nil and not DataResult.isUnavailable and StatusResult ~= "Failed")
			
			return {
				name = "",
				description = "",
				status = if IsNotReady then InviteCardStatus.Loading else InviteCardStatus.Unavailable
			}
		end
	end, isSameExperience)
	local Computed2 = SignalsModule.createComputed(function(p1)
		-- upvalues: GameGetPlayabilityStoreModule (upval), Computed (copy)
		local AndFetchPlayability = GameGetPlayabilityStoreModule(p1).getAndFetchPlayability(Computed(p1))
		local DataResult = AndFetchPlayability.data(p1)
		
		return {
			isPlayable = DataResult ~= nil and DataResult.isPlayable,
			isLoading = DataResult == nil and AndFetchPlayability.status(p1) == "NotReady"
		}
	end, isSamePlayability)
	
	return {
		universeId = Computed,
		experience = Computed1,
		status = SignalsModule.createComputed(function(p1)
			-- upvalues: Computed1 (copy), Computed2 (copy), InviteCardStatus (upval)
			local ComputedResult = Computed1(p1)
			local IsLoading = Computed2(p1).isLoading
			
			return if ComputedResult.status == InviteCardStatus.Ready and IsLoading then InviteCardStatus.Loading else ComputedResult.status
		end),
		canJoin = SignalsModule.createComputed(function(p1)
			-- upvalues: Computed2 (copy)
			return Computed2(p1).isPlayable
		end)
	}
end

return function(Callback)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), createGetters (copy), SignalsModule (copy), InviteCardStatus (copy), UseSignalStateFunction (copy), UseSignalBindingFunction (copy), JoinInviteModule (copy), ResolveInviteLinkModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		unavailable = "Feature.Chat.Label.Unavailable",
		join = "Common.VisitGame.Label.Play"
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: createGetters (upval), Callback (copy)
		return (createGetters(Callback))
	end, { Callback })
	local UseRefResult = ReactModule.useRef(false)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseMemoResult (copy), InviteCardStatus (upval), UseLocalizationResult (copy)
		return {
			thumbnail = SignalsModule.createComputed(function(p1): string
				-- upvalues: UseMemoResult (upval)
				return string.format("rbxthumb://type=GameIcon&id=%s&w=512&h=512", UseMemoResult.universeId(p1))
			end),
			title = SignalsModule.createComputed(function(p1)
				-- upvalues: UseMemoResult (upval), InviteCardStatus (upval), UseLocalizationResult (upval)
				local ExperienceResult = UseMemoResult.experience(p1)
				
				return if ExperienceResult.status == InviteCardStatus.Unavailable then UseLocalizationResult.unavailable else ExperienceResult.name
			end),
			description = SignalsModule.createComputed(function(p1)
				-- upvalues: UseMemoResult (upval)
				return UseMemoResult.experience(p1).description
			end)
		}
	end, { UseMemoResult, UseLocalizationResult.unavailable })
	local UseSignalStateResult = UseSignalStateFunction(UseMemoResult.status)
	local UseSignalStateResult1 = UseSignalStateFunction(UseMemoResult.canJoin)
	local UseSignalBindingResult = UseSignalBindingFunction(UseMemoResult1.thumbnail)
	local UseSignalBindingResult1 = UseSignalBindingFunction(UseMemoResult1.title)
	local UseSignalBindingResult2 = UseSignalBindingFunction(UseMemoResult1.description)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult (copy), UseRefResult (copy), Callback (copy), JoinInviteModule (upval), ResolveInviteLinkModule (upval)
		local RootPlaceId = UseMemoResult.experience(false).rootPlaceId
		
		if RootPlaceId == nil or UseRefResult.current then return end
		local CallbackResult = Callback(false)
		
		if CallbackResult.shareLinkId == nil then
			JoinInviteModule({ placeId = RootPlaceId })
			
			return
		else
			UseRefResult.current = true
			ResolveInviteLinkModule(CallbackResult.shareLinkId, {
				universeId = CallbackResult.universeId,
				rootPlaceId = RootPlaceId
			}):andThen(function(Result)
				-- upvalues: UseRefResult (upval), JoinInviteModule (upval), RootPlaceId (copy)
				UseRefResult.current = false
				JoinInviteModule(Result or { placeId = RootPlaceId })
			end)
		end
	end, { Callback, UseMemoResult })
	
	return {
		status = UseSignalStateResult,
		thumbnail = UseSignalBindingResult,
		title = UseSignalBindingResult1,
		description = UseSignalBindingResult2,
		joinText = UseLocalizationResult.join,
		onJoin = if UseSignalStateResult1 then UseResult else nil
	}
end
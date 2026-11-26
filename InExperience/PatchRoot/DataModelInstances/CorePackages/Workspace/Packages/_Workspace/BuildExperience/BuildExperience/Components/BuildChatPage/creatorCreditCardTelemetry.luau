local HttpService = game:GetService("HttpService")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local _ = require(BuildExperience.Components.CreatorCreditSheet.useOpenBuyRobuxWebView)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local config = {
	FreeTrialExhausted = true,
	DailyLimitReached = true,
	InsufficientRobuxBalance = true
}
local t = {}

local function _(p1)
	return if p1 == nil then "chat_card" else p1.context
end

local _ = function(p1)
	-- upvalues: t (copy)
	return if p1 == nil then t else p1.granularity
end

local function getCardParameters(ChatCard, Reason, NamedTier, RequiredRobux)
	-- upvalues: config (copy)
	local config1 = {
		context = ChatCard,
		isInExperience = if game.GameId == 0 then "false" else "true",
		reason = if Reason == nil or not config[Reason] then "generic" else Reason,
		tier = NamedTier or "default"
	}
	
	if RequiredRobux ~= nil then
		config1.requiredRobux = tostring(RequiredRobux)
	end
	return config1
end

local _ = function(Tbl, Key, p1)
	local Copy = table.clone(Tbl)
	Copy[Key] = p1
	
	return Copy
end

return {
	useCardBuyRobux = function(p1, p2, p3, p4, Callback)
		-- upvalues: ReactModule (copy), t (copy), HttpService (copy), SendBuildExperienceEventModule (copy), getCardParameters (copy)
		return ReactModule.useCallback(function()
			-- upvalues: p1 (copy), t (upval), HttpService (upval), SendBuildExperienceEventModule (upval), getCardParameters (upval), p2 (copy), p3 (copy), p4 (copy), Callback (copy)
			local ChatCard = if p1 == nil then "chat_card" else p1.context
			local T = if p1 == nil then t else p1.granularity
			local Guid = HttpService:GenerateGUID(false)
			local Copy = table.clone((getCardParameters(ChatCard, p2, p3, p4)))
			Copy.buyRobuxAttemptId = Guid
			SendBuildExperienceEventModule("BUY_ROBUX_CLICK", T, Copy)
			Callback({ id = Guid, context = ChatCard, granularity = T })
		end, {
			p1,
			p2,
			p3,
			p4,
			Callback
		})
	end,
	useCardEvents = function(p1)
		-- upvalues: t (copy), ReactModule (copy), getCardParameters (copy), SendBuildExperienceEventModule (copy)
		local Telemetry = p1.telemetry
		local ChatCard = if Telemetry == nil then "chat_card" else Telemetry.context
		local T = if Telemetry == nil then t else Telemetry.granularity
		local NoTelemetry: boolean = p1.isCardVisible and (Telemetry == nil or Telemetry.isSurfaceVisible ~= false)
		local Reason = p1.reason
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: getCardParameters (upval), ChatCard (copy), Reason (copy), p1 (copy)
			return (getCardParameters(ChatCard, Reason, p1.namedTier, p1.requiredRobux))
		end, { ChatCard, Reason, p1.namedTier, p1.requiredRobux })
		local PromptFailure: string = if p1.isPromptFailure then "prompt_failure" else "quota"
		local UseRefResult = ReactModule.useRef(nil)
		ReactModule.useEffect(function()
			-- upvalues: NoTelemetry (copy), UseRefResult (copy), Reason (copy), SendBuildExperienceEventModule (upval), T (copy), UseMemoResult (copy), PromptFailure (copy)
			if not NoTelemetry then
				UseRefResult.current = nil
				
				return
			end
			if UseRefResult.current ~= Reason then
				UseRefResult.current = Reason
				local Copy = table.clone(UseMemoResult)
				Copy.trigger = PromptFailure
				SendBuildExperienceEventModule("CREATOR_CREDIT_CARD_IMPRESSION", T, Copy)
				
				return
			end
		end, {
			NoTelemetry,
			Reason,
			UseMemoResult,
			T,
			PromptFailure
		})
		local PrimaryAction = p1.primaryAction
		local OnPrimaryActionFunction = p1.onPrimaryAction
		local SecondaryAction = p1.secondaryAction
		local OnSecondaryActionFunction = p1.onSecondaryAction
		
		return {
			onPrimaryAction = ReactModule.useCallback(function()
				-- upvalues: SendBuildExperienceEventModule (upval), T (copy), UseMemoResult (copy), PrimaryAction (copy), OnPrimaryActionFunction (copy)
				local Copy = table.clone(UseMemoResult)
				Copy.action = PrimaryAction
				SendBuildExperienceEventModule("CREATOR_CREDIT_CARD_CLICK", T, Copy)
				OnPrimaryActionFunction()
			end, { T, UseMemoResult, PrimaryAction, OnPrimaryActionFunction }),
			onSecondaryAction = ReactModule.useCallback(function()
				-- upvalues: SendBuildExperienceEventModule (upval), T (copy), UseMemoResult (copy), SecondaryAction (copy), OnSecondaryActionFunction (copy)
				local Copy = table.clone(UseMemoResult)
				Copy.action = SecondaryAction
				SendBuildExperienceEventModule("CREATOR_CREDIT_CARD_CLICK", T, Copy)
				OnSecondaryActionFunction()
			end, {
				T,
				UseMemoResult,
				SecondaryAction,
				OnSecondaryActionFunction
			})
		}
	end
}
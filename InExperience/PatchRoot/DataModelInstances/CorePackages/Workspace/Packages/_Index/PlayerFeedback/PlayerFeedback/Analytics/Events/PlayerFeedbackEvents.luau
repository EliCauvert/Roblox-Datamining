local Parent = script:FindFirstAncestor("PlayerFeedback").Parent
local ConstantsModule = require(script.Parent.Parent.Constants)
local CryoModule = require(Parent.Cryo)
local TModule = require(Parent.t)
local MutedErrorFunction = require(Parent.Loggers).mutedError
local OptionalResult = TModule.optional(TModule.strictInterface({
	categoryType = TModule.optional(TModule.string),
	value = TModule.optional(TModule.string)
}))

local function _(p1) --[[ Line: 12 | Named "gamePlayerFeedbackEvent" ]]
	-- upvalues: OptionalResult (copy), MutedErrorFunction (copy), CryoModule (copy), ConstantsModule (copy)
	return function(p2, PlaceId, p3) --[[ Line: 13 ]]
		-- upvalues: OptionalResult (upval), MutedErrorFunction (upval), CryoModule (upval), ConstantsModule (upval), p1 (copy)
		local OptionalResultResult, OptionalResultResult2 = OptionalResult(p3)
		
		if not OptionalResultResult then
			MutedErrorFunction(OptionalResultResult2)
		end
		local JoinResult = { placeId = PlaceId }
		
		if p3 then
			JoinResult = CryoModule.Dictionary.join(JoinResult, p3)
		end
		p2:sendEventDeferred(ConstantsModule.Context.GamePlayerFeedback, p1, JoinResult)
	end
end

local ClickPlayerFeedbackPromptCta = ConstantsModule.EventNames.ClickPlayerFeedbackPromptCta

local function ClickPlayerFeedbackPromptCta1(p1, PlaceId, p2) --[[ Line: 13 ]]
	-- upvalues: OptionalResult (copy), MutedErrorFunction (copy), CryoModule (copy), ConstantsModule (copy), ClickPlayerFeedbackPromptCta (copy)
	local OptionalResultResult, OptionalResultResult2 = OptionalResult(p2)
	
	if not OptionalResultResult then
		MutedErrorFunction(OptionalResultResult2)
	end
	local JoinResult = { placeId = PlaceId }
	
	if p2 then
		JoinResult = CryoModule.Dictionary.join(JoinResult, p2)
	end
	p1:sendEventDeferred(ConstantsModule.Context.GamePlayerFeedback, ClickPlayerFeedbackPromptCta, JoinResult)
end

local PlayerFeedbackPromptMounted = ConstantsModule.EventNames.PlayerFeedbackPromptMounted

local function PlayerFeedbackPromptMounted1(p1, PlaceId, p2) --[[ Line: 13 ]]
	-- upvalues: OptionalResult (copy), MutedErrorFunction (copy), CryoModule (copy), ConstantsModule (copy), PlayerFeedbackPromptMounted (copy)
	local OptionalResultResult, OptionalResultResult2 = OptionalResult(p2)
	
	if not OptionalResultResult then
		MutedErrorFunction(OptionalResultResult2)
	end
	local JoinResult = { placeId = PlaceId }
	
	if p2 then
		JoinResult = CryoModule.Dictionary.join(JoinResult, p2)
	end
	p1:sendEventDeferred(ConstantsModule.Context.GamePlayerFeedback, PlayerFeedbackPromptMounted, JoinResult)
end

local DismissPlayerFeedbackPrompt = ConstantsModule.EventNames.DismissPlayerFeedbackPrompt

local function DismissPlayerFeedbackPrompt1(p1, PlaceId, p2) --[[ Line: 13 ]]
	-- upvalues: OptionalResult (copy), MutedErrorFunction (copy), CryoModule (copy), ConstantsModule (copy), DismissPlayerFeedbackPrompt (copy)
	local OptionalResultResult, OptionalResultResult2 = OptionalResult(p2)
	
	if not OptionalResultResult then
		MutedErrorFunction(OptionalResultResult2)
	end
	local JoinResult = { placeId = PlaceId }
	
	if p2 then
		JoinResult = CryoModule.Dictionary.join(JoinResult, p2)
	end
	p1:sendEventDeferred(ConstantsModule.Context.GamePlayerFeedback, DismissPlayerFeedbackPrompt, JoinResult)
end

local PlayerFeedbackFormModalMounted = ConstantsModule.EventNames.PlayerFeedbackFormModalMounted

local function PlayerFeedbackFormModalMounted1(p1, PlaceId, p2) --[[ Line: 13 ]]
	-- upvalues: OptionalResult (copy), MutedErrorFunction (copy), CryoModule (copy), ConstantsModule (copy), PlayerFeedbackFormModalMounted (copy)
	local OptionalResultResult, OptionalResultResult2 = OptionalResult(p2)
	
	if not OptionalResultResult then
		MutedErrorFunction(OptionalResultResult2)
	end
	local JoinResult = { placeId = PlaceId }
	
	if p2 then
		JoinResult = CryoModule.Dictionary.join(JoinResult, p2)
	end
	p1:sendEventDeferred(ConstantsModule.Context.GamePlayerFeedback, PlayerFeedbackFormModalMounted, JoinResult)
end

local DismissPlayerFeedbackFormModal = ConstantsModule.EventNames.DismissPlayerFeedbackFormModal

local function DismissPlayerFeedbackFormModal1(p1, PlaceId, p2) --[[ Line: 13 ]]
	-- upvalues: OptionalResult (copy), MutedErrorFunction (copy), CryoModule (copy), ConstantsModule (copy), DismissPlayerFeedbackFormModal (copy)
	local OptionalResultResult, OptionalResultResult2 = OptionalResult(p2)
	
	if not OptionalResultResult then
		MutedErrorFunction(OptionalResultResult2)
	end
	local JoinResult = { placeId = PlaceId }
	
	if p2 then
		JoinResult = CryoModule.Dictionary.join(JoinResult, p2)
	end
	p1:sendEventDeferred(ConstantsModule.Context.GamePlayerFeedback, DismissPlayerFeedbackFormModal, JoinResult)
end

local ClickPlayerFeedbackFormModalDisclaimer = ConstantsModule.EventNames.ClickPlayerFeedbackFormModalDisclaimer

local function ClickPlayerFeedbackFormModalDisclaimer1(p1, PlaceId, p2) --[[ Line: 13 ]]
	-- upvalues: OptionalResult (copy), MutedErrorFunction (copy), CryoModule (copy), ConstantsModule (copy), ClickPlayerFeedbackFormModalDisclaimer (copy)
	local OptionalResultResult, OptionalResultResult2 = OptionalResult(p2)
	
	if not OptionalResultResult then
		MutedErrorFunction(OptionalResultResult2)
	end
	local JoinResult = { placeId = PlaceId }
	
	if p2 then
		JoinResult = CryoModule.Dictionary.join(JoinResult, p2)
	end
	p1:sendEventDeferred(ConstantsModule.Context.GamePlayerFeedback, ClickPlayerFeedbackFormModalDisclaimer, JoinResult)
end

local ClickPlayerFeedbackFormAbuseReportPrompt = ConstantsModule.EventNames.ClickPlayerFeedbackFormAbuseReportPrompt

local function ClickPlayerFeedbackFormAbuseReportPrompt1(p1, PlaceId, p2) --[[ Line: 13 ]]
	-- upvalues: OptionalResult (copy), MutedErrorFunction (copy), CryoModule (copy), ConstantsModule (copy), ClickPlayerFeedbackFormAbuseReportPrompt (copy)
	local OptionalResultResult, OptionalResultResult2 = OptionalResult(p2)
	
	if not OptionalResultResult then
		MutedErrorFunction(OptionalResultResult2)
	end
	local JoinResult = { placeId = PlaceId }
	
	if p2 then
		JoinResult = CryoModule.Dictionary.join(JoinResult, p2)
	end
	p1:sendEventDeferred(ConstantsModule.Context.GamePlayerFeedback, ClickPlayerFeedbackFormAbuseReportPrompt, JoinResult)
end

local TogglePlayerFeedbackFormModalReason = ConstantsModule.EventNames.TogglePlayerFeedbackFormModalReason

local function TogglePlayerFeedbackFormModalReason1(p1, PlaceId, p2) --[[ Line: 13 ]]
	-- upvalues: OptionalResult (copy), MutedErrorFunction (copy), CryoModule (copy), ConstantsModule (copy), TogglePlayerFeedbackFormModalReason (copy)
	local OptionalResultResult, OptionalResultResult2 = OptionalResult(p2)
	
	if not OptionalResultResult then
		MutedErrorFunction(OptionalResultResult2)
	end
	local JoinResult = { placeId = PlaceId }
	
	if p2 then
		JoinResult = CryoModule.Dictionary.join(JoinResult, p2)
	end
	p1:sendEventDeferred(ConstantsModule.Context.GamePlayerFeedback, TogglePlayerFeedbackFormModalReason, JoinResult)
end

local FocusPlayerFeedbackFormModalComment = ConstantsModule.EventNames.FocusPlayerFeedbackFormModalComment

local function FocusPlayerFeedbackFormModalComment1(p1, PlaceId, p2) --[[ Line: 13 ]]
	-- upvalues: OptionalResult (copy), MutedErrorFunction (copy), CryoModule (copy), ConstantsModule (copy), FocusPlayerFeedbackFormModalComment (copy)
	local OptionalResultResult, OptionalResultResult2 = OptionalResult(p2)
	
	if not OptionalResultResult then
		MutedErrorFunction(OptionalResultResult2)
	end
	local JoinResult = { placeId = PlaceId }
	
	if p2 then
		JoinResult = CryoModule.Dictionary.join(JoinResult, p2)
	end
	p1:sendEventDeferred(ConstantsModule.Context.GamePlayerFeedback, FocusPlayerFeedbackFormModalComment, JoinResult)
end

local ClickPlayerFeedbackFormModalSubmit = ConstantsModule.EventNames.ClickPlayerFeedbackFormModalSubmit

local function ClickPlayerFeedbackFormModalSubmit1(p1, PlaceId, p2) --[[ Line: 13 ]]
	-- upvalues: OptionalResult (copy), MutedErrorFunction (copy), CryoModule (copy), ConstantsModule (copy), ClickPlayerFeedbackFormModalSubmit (copy)
	local OptionalResultResult, OptionalResultResult2 = OptionalResult(p2)
	
	if not OptionalResultResult then
		MutedErrorFunction(OptionalResultResult2)
	end
	local JoinResult = { placeId = PlaceId }
	
	if p2 then
		JoinResult = CryoModule.Dictionary.join(JoinResult, p2)
	end
	p1:sendEventDeferred(ConstantsModule.Context.GamePlayerFeedback, ClickPlayerFeedbackFormModalSubmit, JoinResult)
end

local SubmitPlayerFeedbackFailCommentValidation = ConstantsModule.EventNames.SubmitPlayerFeedbackFailCommentValidation

return {
	ClickPlayerFeedbackPromptCta = ClickPlayerFeedbackPromptCta1,
	PlayerFeedbackPromptMounted = PlayerFeedbackPromptMounted1,
	DismissPlayerFeedbackPrompt = DismissPlayerFeedbackPrompt1,
	PlayerFeedbackFormModalMounted = PlayerFeedbackFormModalMounted1,
	DismissPlayerFeedbackFormModal = DismissPlayerFeedbackFormModal1,
	ClickPlayerFeedbackFormModalDisclaimer = ClickPlayerFeedbackFormModalDisclaimer1,
	ClickPlayerFeedbackFormAbuseReportPrompt = ClickPlayerFeedbackFormAbuseReportPrompt1,
	TogglePlayerFeedbackFormModalReason = TogglePlayerFeedbackFormModalReason1,
	FocusPlayerFeedbackFormModalComment = FocusPlayerFeedbackFormModalComment1,
	ClickPlayerFeedbackFormModalSubmit = ClickPlayerFeedbackFormModalSubmit1,
	SubmitPlayerFeedbackFailCommentValidation = function(p1, PlaceId, p2) --[[ Line: 13 ]]
		-- upvalues: OptionalResult (copy), MutedErrorFunction (copy), CryoModule (copy), ConstantsModule (copy), SubmitPlayerFeedbackFailCommentValidation (copy)
		local OptionalResultResult, OptionalResultResult2 = OptionalResult(p2)
		
		if not OptionalResultResult then
			MutedErrorFunction(OptionalResultResult2)
		end
		local JoinResult = { placeId = PlaceId }
		
		if p2 then
			JoinResult = CryoModule.Dictionary.join(JoinResult, p2)
		end
		p1:sendEventDeferred(ConstantsModule.Context.GamePlayerFeedback, SubmitPlayerFeedbackFailCommentValidation, JoinResult)
	end
}
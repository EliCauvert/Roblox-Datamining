local parent = script:FindFirstAncestor("PlayerFeedback").Parent
local constantsModule = require(script.Parent.Parent.Constants)
local cryoModule = require(parent.Cryo)
local tModule = require(parent.t)
local mutedError = require(parent.Loggers).mutedError
local var1 = tModule.optional(tModule.strictInterface({
	categoryType = tModule.optional(tModule.string),
	value = tModule.optional(tModule.string)
}))

local function _(p1)
	-- upvalues: var1 (ref), mutedError (ref), cryoModule (ref), constantsModule (ref)
	return function(p2, p3, p4)
		-- upvalues: var1 (copy), mutedError (copy), cryoModule (copy), constantsModule (copy), p1 (ref)
		local var2, var3 = var1(p4)
		
		if not var2 then
			mutedError(var3)
		end
		local t = { placeId = p3 }
		
		if p4 then
			t = cryoModule.Dictionary.join(t, p4)
		end
		p2:sendEventDeferred(constantsModule.Context.GamePlayerFeedback, p1, t)
	end
end

local t = {}
local clickPlayerFeedbackPromptCta = constantsModule.EventNames.ClickPlayerFeedbackPromptCta

function t.ClickPlayerFeedbackPromptCta(p1, p2, p3)
	-- upvalues: var1 (ref), mutedError (ref), cryoModule (ref), constantsModule (ref), clickPlayerFeedbackPromptCta (ref)
	local var2, var3 = var1(p3)
	
	if not var2 then
		mutedError(var3)
	end
	local t = { placeId = p2 }
	
	if p3 then
		t = cryoModule.Dictionary.join(t, p3)
	end
	p1:sendEventDeferred(constantsModule.Context.GamePlayerFeedback, clickPlayerFeedbackPromptCta, t)
end

local playerFeedbackPromptMounted = constantsModule.EventNames.PlayerFeedbackPromptMounted

function t.PlayerFeedbackPromptMounted(p1, p2, p3)
	-- upvalues: var1 (ref), mutedError (ref), cryoModule (ref), constantsModule (ref), playerFeedbackPromptMounted (ref)
	local var2, var3 = var1(p3)
	
	if not var2 then
		mutedError(var3)
	end
	local t = { placeId = p2 }
	
	if p3 then
		t = cryoModule.Dictionary.join(t, p3)
	end
	p1:sendEventDeferred(constantsModule.Context.GamePlayerFeedback, playerFeedbackPromptMounted, t)
end

local dismissPlayerFeedbackPrompt = constantsModule.EventNames.DismissPlayerFeedbackPrompt

function t.DismissPlayerFeedbackPrompt(p1, p2, p3)
	-- upvalues: var1 (ref), mutedError (ref), cryoModule (ref), constantsModule (ref), dismissPlayerFeedbackPrompt (ref)
	local var2, var3 = var1(p3)
	
	if not var2 then
		mutedError(var3)
	end
	local t = { placeId = p2 }
	
	if p3 then
		t = cryoModule.Dictionary.join(t, p3)
	end
	p1:sendEventDeferred(constantsModule.Context.GamePlayerFeedback, dismissPlayerFeedbackPrompt, t)
end

local playerFeedbackFormModalMounted = constantsModule.EventNames.PlayerFeedbackFormModalMounted

function t.PlayerFeedbackFormModalMounted(p1, p2, p3)
	-- upvalues: var1 (ref), mutedError (ref), cryoModule (ref), constantsModule (ref), playerFeedbackFormModalMounted (ref)
	local var2, var3 = var1(p3)
	
	if not var2 then
		mutedError(var3)
	end
	local t = { placeId = p2 }
	
	if p3 then
		t = cryoModule.Dictionary.join(t, p3)
	end
	p1:sendEventDeferred(constantsModule.Context.GamePlayerFeedback, playerFeedbackFormModalMounted, t)
end

local dismissPlayerFeedbackFormModal = constantsModule.EventNames.DismissPlayerFeedbackFormModal

function t.DismissPlayerFeedbackFormModal(p1, p2, p3)
	-- upvalues: var1 (ref), mutedError (ref), cryoModule (ref), constantsModule (ref), dismissPlayerFeedbackFormModal (ref)
	local var2, var3 = var1(p3)
	
	if not var2 then
		mutedError(var3)
	end
	local t = { placeId = p2 }
	
	if p3 then
		t = cryoModule.Dictionary.join(t, p3)
	end
	p1:sendEventDeferred(constantsModule.Context.GamePlayerFeedback, dismissPlayerFeedbackFormModal, t)
end

local clickPlayerFeedbackFormModalDisclaimer = constantsModule.EventNames.ClickPlayerFeedbackFormModalDisclaimer

function t.ClickPlayerFeedbackFormModalDisclaimer(p1, p2, p3)
	-- upvalues: var1 (ref), mutedError (ref), cryoModule (ref), constantsModule (ref), clickPlayerFeedbackFormModalDisclaimer (ref)
	local var2, var3 = var1(p3)
	
	if not var2 then
		mutedError(var3)
	end
	local t = { placeId = p2 }
	
	if p3 then
		t = cryoModule.Dictionary.join(t, p3)
	end
	p1:sendEventDeferred(constantsModule.Context.GamePlayerFeedback, clickPlayerFeedbackFormModalDisclaimer, t)
end

local clickPlayerFeedbackFormAbuseReportPrompt = constantsModule.EventNames.ClickPlayerFeedbackFormAbuseReportPrompt

function t.ClickPlayerFeedbackFormAbuseReportPrompt(p1, p2, p3)
	-- upvalues: var1 (ref), mutedError (ref), cryoModule (ref), constantsModule (ref), clickPlayerFeedbackFormAbuseReportPrompt (ref)
	local var2, var3 = var1(p3)
	
	if not var2 then
		mutedError(var3)
	end
	local t = { placeId = p2 }
	
	if p3 then
		t = cryoModule.Dictionary.join(t, p3)
	end
	p1:sendEventDeferred(constantsModule.Context.GamePlayerFeedback, clickPlayerFeedbackFormAbuseReportPrompt, t)
end

local togglePlayerFeedbackFormModalReason = constantsModule.EventNames.TogglePlayerFeedbackFormModalReason

function t.TogglePlayerFeedbackFormModalReason(p1, p2, p3)
	-- upvalues: var1 (ref), mutedError (ref), cryoModule (ref), constantsModule (ref), togglePlayerFeedbackFormModalReason (ref)
	local var2, var3 = var1(p3)
	
	if not var2 then
		mutedError(var3)
	end
	local t = { placeId = p2 }
	
	if p3 then
		t = cryoModule.Dictionary.join(t, p3)
	end
	p1:sendEventDeferred(constantsModule.Context.GamePlayerFeedback, togglePlayerFeedbackFormModalReason, t)
end

local focusPlayerFeedbackFormModalComment = constantsModule.EventNames.FocusPlayerFeedbackFormModalComment

function t.FocusPlayerFeedbackFormModalComment(p1, p2, p3)
	-- upvalues: var1 (ref), mutedError (ref), cryoModule (ref), constantsModule (ref), focusPlayerFeedbackFormModalComment (ref)
	local var2, var3 = var1(p3)
	
	if not var2 then
		mutedError(var3)
	end
	local t = { placeId = p2 }
	
	if p3 then
		t = cryoModule.Dictionary.join(t, p3)
	end
	p1:sendEventDeferred(constantsModule.Context.GamePlayerFeedback, focusPlayerFeedbackFormModalComment, t)
end

local clickPlayerFeedbackFormModalSubmit = constantsModule.EventNames.ClickPlayerFeedbackFormModalSubmit

function t.ClickPlayerFeedbackFormModalSubmit(p1, p2, p3)
	-- upvalues: var1 (ref), mutedError (ref), cryoModule (ref), constantsModule (ref), clickPlayerFeedbackFormModalSubmit (ref)
	local var2, var3 = var1(p3)
	
	if not var2 then
		mutedError(var3)
	end
	local t = { placeId = p2 }
	
	if p3 then
		t = cryoModule.Dictionary.join(t, p3)
	end
	p1:sendEventDeferred(constantsModule.Context.GamePlayerFeedback, clickPlayerFeedbackFormModalSubmit, t)
end

local submitPlayerFeedbackFailCommentValidation = constantsModule.EventNames.SubmitPlayerFeedbackFailCommentValidation

function t.SubmitPlayerFeedbackFailCommentValidation(p1, p2, p3)
	-- upvalues: var1 (ref), mutedError (ref), cryoModule (ref), constantsModule (ref), submitPlayerFeedbackFailCommentValidation (ref)
	local var2, var3 = var1(p3)
	
	if not var2 then
		mutedError(var3)
	end
	local t = { placeId = p2 }
	
	if p3 then
		t = cryoModule.Dictionary.join(t, p3)
	end
	p1:sendEventDeferred(constantsModule.Context.GamePlayerFeedback, submitPlayerFeedbackFailCommentValidation, t)
end

return t
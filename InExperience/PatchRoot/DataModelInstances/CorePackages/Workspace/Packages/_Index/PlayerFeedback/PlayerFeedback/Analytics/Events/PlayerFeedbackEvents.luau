local parent = script:FindFirstAncestor("PlayerFeedback").Parent
local constantsModule = require(script.Parent.Parent.Constants)
local cryoModule = require(parent.Cryo)
local tModule = require(parent.t)
local mutedError = require(parent.Loggers).mutedError
local var3 = tModule.optional(tModule.strictInterface({
	categoryType = tModule.optional(tModule.string),
	value = tModule.optional(tModule.string)
}))

local function _(p0)
	-- upvalues: var3 (ref), mutedError (ref), cryoModule (ref), constantsModule (ref)
	return function(p1, p2, p3)
		-- upvalues: var3 (copy), mutedError (copy), cryoModule (copy), constantsModule (copy), p0 (ref)
		local var5, var6 = var3(p3)
		
		if not var5 then
			mutedError(var6)
		end
		local t = { placeId = p2 }
		
		if p3 then
			t = cryoModule.Dictionary.join(t, p3)
		end
		p1:sendEventDeferred(constantsModule.Context.GamePlayerFeedback, p0, t)
	end
end

local t = {}
local clickPlayerFeedbackPromptCta = constantsModule.EventNames.ClickPlayerFeedbackPromptCta

function t.ClickPlayerFeedbackPromptCta(p4, p5, p6)
	-- upvalues: var3 (ref), mutedError (ref), cryoModule (ref), constantsModule (ref), clickPlayerFeedbackPromptCta (ref)
	local var5, var6 = var3(p6)
	
	if not var5 then
		mutedError(var6)
	end
	local t = { placeId = p5 }
	
	if p6 then
		t = cryoModule.Dictionary.join(t, p6)
	end
	p4:sendEventDeferred(constantsModule.Context.GamePlayerFeedback, clickPlayerFeedbackPromptCta, t)
end

local playerFeedbackPromptMounted = constantsModule.EventNames.PlayerFeedbackPromptMounted

function t.PlayerFeedbackPromptMounted(p7, p8, p9)
	-- upvalues: var3 (ref), mutedError (ref), cryoModule (ref), constantsModule (ref), playerFeedbackPromptMounted (ref)
	local var5, var6 = var3(p9)
	
	if not var5 then
		mutedError(var6)
	end
	local t = { placeId = p8 }
	
	if p9 then
		t = cryoModule.Dictionary.join(t, p9)
	end
	p7:sendEventDeferred(constantsModule.Context.GamePlayerFeedback, playerFeedbackPromptMounted, t)
end

local dismissPlayerFeedbackPrompt = constantsModule.EventNames.DismissPlayerFeedbackPrompt

function t.DismissPlayerFeedbackPrompt(p10, p11, p12)
	-- upvalues: var3 (ref), mutedError (ref), cryoModule (ref), constantsModule (ref), dismissPlayerFeedbackPrompt (ref)
	local var5, var6 = var3(p12)
	
	if not var5 then
		mutedError(var6)
	end
	local t = { placeId = p11 }
	
	if p12 then
		t = cryoModule.Dictionary.join(t, p12)
	end
	p10:sendEventDeferred(constantsModule.Context.GamePlayerFeedback, dismissPlayerFeedbackPrompt, t)
end

local playerFeedbackFormModalMounted = constantsModule.EventNames.PlayerFeedbackFormModalMounted

function t.PlayerFeedbackFormModalMounted(p13, p14, p15)
	-- upvalues: var3 (ref), mutedError (ref), cryoModule (ref), constantsModule (ref), playerFeedbackFormModalMounted (ref)
	local var5, var6 = var3(p15)
	
	if not var5 then
		mutedError(var6)
	end
	local t = { placeId = p14 }
	
	if p15 then
		t = cryoModule.Dictionary.join(t, p15)
	end
	p13:sendEventDeferred(constantsModule.Context.GamePlayerFeedback, playerFeedbackFormModalMounted, t)
end

local dismissPlayerFeedbackFormModal = constantsModule.EventNames.DismissPlayerFeedbackFormModal

function t.DismissPlayerFeedbackFormModal(p16, p17, p18)
	-- upvalues: var3 (ref), mutedError (ref), cryoModule (ref), constantsModule (ref), dismissPlayerFeedbackFormModal (ref)
	local var5, var6 = var3(p18)
	
	if not var5 then
		mutedError(var6)
	end
	local t = { placeId = p17 }
	
	if p18 then
		t = cryoModule.Dictionary.join(t, p18)
	end
	p16:sendEventDeferred(constantsModule.Context.GamePlayerFeedback, dismissPlayerFeedbackFormModal, t)
end

local clickPlayerFeedbackFormModalDisclaimer = constantsModule.EventNames.ClickPlayerFeedbackFormModalDisclaimer

function t.ClickPlayerFeedbackFormModalDisclaimer(p19, p20, p21)
	-- upvalues: var3 (ref), mutedError (ref), cryoModule (ref), constantsModule (ref), clickPlayerFeedbackFormModalDisclaimer (ref)
	local var5, var6 = var3(p21)
	
	if not var5 then
		mutedError(var6)
	end
	local t = { placeId = p20 }
	
	if p21 then
		t = cryoModule.Dictionary.join(t, p21)
	end
	p19:sendEventDeferred(constantsModule.Context.GamePlayerFeedback, clickPlayerFeedbackFormModalDisclaimer, t)
end

local clickPlayerFeedbackFormAbuseReportPrompt = constantsModule.EventNames.ClickPlayerFeedbackFormAbuseReportPrompt

function t.ClickPlayerFeedbackFormAbuseReportPrompt(p22, p23, p24)
	-- upvalues: var3 (ref), mutedError (ref), cryoModule (ref), constantsModule (ref), clickPlayerFeedbackFormAbuseReportPrompt (ref)
	local var5, var6 = var3(p24)
	
	if not var5 then
		mutedError(var6)
	end
	local t = { placeId = p23 }
	
	if p24 then
		t = cryoModule.Dictionary.join(t, p24)
	end
	p22:sendEventDeferred(constantsModule.Context.GamePlayerFeedback, clickPlayerFeedbackFormAbuseReportPrompt, t)
end

local togglePlayerFeedbackFormModalReason = constantsModule.EventNames.TogglePlayerFeedbackFormModalReason

function t.TogglePlayerFeedbackFormModalReason(p25, p26, p27)
	-- upvalues: var3 (ref), mutedError (ref), cryoModule (ref), constantsModule (ref), togglePlayerFeedbackFormModalReason (ref)
	local var5, var6 = var3(p27)
	
	if not var5 then
		mutedError(var6)
	end
	local t = { placeId = p26 }
	
	if p27 then
		t = cryoModule.Dictionary.join(t, p27)
	end
	p25:sendEventDeferred(constantsModule.Context.GamePlayerFeedback, togglePlayerFeedbackFormModalReason, t)
end

local focusPlayerFeedbackFormModalComment = constantsModule.EventNames.FocusPlayerFeedbackFormModalComment

function t.FocusPlayerFeedbackFormModalComment(p28, p29, p30)
	-- upvalues: var3 (ref), mutedError (ref), cryoModule (ref), constantsModule (ref), focusPlayerFeedbackFormModalComment (ref)
	local var5, var6 = var3(p30)
	
	if not var5 then
		mutedError(var6)
	end
	local t = { placeId = p29 }
	
	if p30 then
		t = cryoModule.Dictionary.join(t, p30)
	end
	p28:sendEventDeferred(constantsModule.Context.GamePlayerFeedback, focusPlayerFeedbackFormModalComment, t)
end

local clickPlayerFeedbackFormModalSubmit = constantsModule.EventNames.ClickPlayerFeedbackFormModalSubmit

function t.ClickPlayerFeedbackFormModalSubmit(p31, p32, p33)
	-- upvalues: var3 (ref), mutedError (ref), cryoModule (ref), constantsModule (ref), clickPlayerFeedbackFormModalSubmit (ref)
	local var5, var6 = var3(p33)
	
	if not var5 then
		mutedError(var6)
	end
	local t = { placeId = p32 }
	
	if p33 then
		t = cryoModule.Dictionary.join(t, p33)
	end
	p31:sendEventDeferred(constantsModule.Context.GamePlayerFeedback, clickPlayerFeedbackFormModalSubmit, t)
end

local submitPlayerFeedbackFailCommentValidation = constantsModule.EventNames.SubmitPlayerFeedbackFailCommentValidation

function t.SubmitPlayerFeedbackFailCommentValidation(p34, p35, p36)
	-- upvalues: var3 (ref), mutedError (ref), cryoModule (ref), constantsModule (ref), submitPlayerFeedbackFailCommentValidation (ref)
	local var5, var6 = var3(p36)
	
	if not var5 then
		mutedError(var6)
	end
	local t = { placeId = p35 }
	
	if p36 then
		t = cryoModule.Dictionary.join(t, p36)
	end
	p34:sendEventDeferred(constantsModule.Context.GamePlayerFeedback, submitPlayerFeedbackFailCommentValidation, t)
end

return t
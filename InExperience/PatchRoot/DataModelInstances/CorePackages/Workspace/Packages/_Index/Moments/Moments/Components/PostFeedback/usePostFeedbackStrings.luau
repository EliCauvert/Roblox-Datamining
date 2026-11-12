local Parent = script:FindFirstAncestor("Moments").Parent
local ReactModule = require(Parent.React)
local LocalizationRoactContext = require(Parent.Localization).LocalizationRoactContext

local function _(p1, p2, p3)
	if p1 == nil then
		return p3
	else
		local Success, Result = pcall(function()
			-- upvalues: p1 (copy), p2 (copy)
			return p1:Format(p2)
		end)
		
		return if Success and typeof(Result) == "string" and Result ~= "" then Result else p3
	end
end

return function()
	-- upvalues: ReactModule (copy), LocalizationRoactContext (copy)
	local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
	
	return ReactModule.useMemo(function()
		-- upvalues: UseContextResult (copy)
		local t = {}
		local PostingYourMomentKeepTheAppOpenAndWeLlNotifyYou = nil
		
		if UseContextResult == nil then
			PostingYourMomentKeepTheAppOpenAndWeLlNotifyYou = "Posting your Moment, keep the app open and we'll notify you"
		else
			local v1 = "Feature.Moments.Label.PostFeedbackPostingSnackbar"
			local Success, Result = pcall(function()
				-- upvalues: UseContextResult (copy), v1 (copy)
				return UseContextResult:Format(v1)
			end)
			PostingYourMomentKeepTheAppOpenAndWeLlNotifyYou = if Success and typeof(Result) == "string" and Result ~= "" then Result else "Posting your Moment, keep the app open and we'll notify you"
		end
		t.postingSnackbar = PostingYourMomentKeepTheAppOpenAndWeLlNotifyYou
		local PostingMoment = nil
		
		if UseContextResult == nil then
			PostingMoment = "Posting Moment"
		else
			local v2 = "Feature.Moments.Label.PostFeedbackPostingTitle"
			local Success1, Result1 = pcall(function()
				-- upvalues: UseContextResult (copy), v2 (copy)
				return UseContextResult:Format(v2)
			end)
			PostingMoment = if Success1 and typeof(Result1) == "string" and Result1 ~= "" then Result1 else "Posting Moment"
		end
		t.postingTitle = PostingMoment
		local ThisMayTakeAMinute = nil
		
		if UseContextResult == nil then
			ThisMayTakeAMinute = "This may take a minute"
		else
			local v3 = "Feature.Moments.Label.PostFeedbackPostingBody"
			local Success2, Result2 = pcall(function()
				-- upvalues: UseContextResult (copy), v3 (copy)
				return UseContextResult:Format(v3)
			end)
			ThisMayTakeAMinute = if Success2 and typeof(Result2) == "string" and Result2 ~= "" then Result2 else "This may take a minute"
		end
		t.postingBody = ThisMayTakeAMinute
		local MomentWasModerated = nil
		
		if UseContextResult == nil then
			MomentWasModerated = "Moment was moderated"
		else
			local v4 = "Feature.Moments.Label.PostFeedbackModeratedTitle"
			local Success3, Result3 = pcall(function()
				-- upvalues: UseContextResult (copy), v4 (copy)
				return UseContextResult:Format(v4)
			end)
			MomentWasModerated = if Success3 and typeof(Result3) == "string" and Result3 ~= "" then Result3 else "Moment was moderated"
		end
		t.moderatedTitle = MomentWasModerated
		local ThisIsModeratedAndHiddenFromOthers = nil
		
		if UseContextResult == nil then
			ThisIsModeratedAndHiddenFromOthers = "This is moderated and hidden from others"
		else
			local v5 = "Feature.Moments.Label.PostFeedbackModeratedBody"
			local Success4, Result4 = pcall(function()
				-- upvalues: UseContextResult (copy), v5 (copy)
				return UseContextResult:Format(v5)
			end)
			ThisIsModeratedAndHiddenFromOthers = if Success4 and typeof(Result4) == "string" and Result4 ~= "" then Result4 else "This is moderated and hidden from others"
		end
		t.moderatedBody = ThisIsModeratedAndHiddenFromOthers
		local Posting = nil
		
		if UseContextResult == nil then
			Posting = "Posting…"
		else
			local v6 = "Feature.Moments.Label.PostFeedbackPostingBadge"
			local Success5, Result5 = pcall(function()
				-- upvalues: UseContextResult (copy), v6 (copy)
				return UseContextResult:Format(v6)
			end)
			Posting = if Success5 and typeof(Result5) == "string" and Result5 ~= "" then Result5 else "Posting…"
		end
		t.postingBadge = Posting
		local Moderated = nil
		
		if UseContextResult == nil then
			Moderated = "Moderated"
		else
			local v7 = "Feature.Moments.Label.PostFeedbackModeratedBadge"
			local Success6, Result6 = pcall(function()
				-- upvalues: UseContextResult (copy), v7 (copy)
				return UseContextResult:Format(v7)
			end)
			Moderated = if Success6 and typeof(Result6) == "string" and Result6 ~= "" then Result6 else "Moderated"
		end
		t.moderatedBadge = Moderated
		local YourMomentIsLive = nil
		
		if UseContextResult == nil then
			YourMomentIsLive = "Your Moment is live"
		else
			local v8 = "Feature.Moments.Label.PostFeedbackLiveTitle"
			local Success7, Result7 = pcall(function()
				-- upvalues: UseContextResult (copy), v8 (copy)
				return UseContextResult:Format(v8)
			end)
			YourMomentIsLive = if Success7 and typeof(Result7) == "string" and Result7 ~= "" then Result7 else "Your Moment is live"
		end
		t.liveTitle = YourMomentIsLive
		local OthersCanNowWatchAndReactToIt = nil
		
		if UseContextResult == nil then
			OthersCanNowWatchAndReactToIt = "Others can now watch and react to it"
		else
			local v9 = "Feature.Moments.Label.PostFeedbackLiveBody"
			local Success9, Result9 = pcall(function()
				-- upvalues: UseContextResult (copy), v9 (copy)
				return UseContextResult:Format(v9)
			end)
			OthersCanNowWatchAndReactToIt = if Success9 and typeof(Result9) == "string" and Result9 ~= "" then Result9 else "Others can now watch and react to it"
		end
		t.liveBody = OthersCanNowWatchAndReactToIt
		local MomentWasnTPosted = nil
		
		if UseContextResult == nil then
			MomentWasnTPosted = "Moment wasn't posted"
		else
			local v10 = "Feature.Moments.Label.PostFeedbackFailedTitle"
			local Success10, Result10 = pcall(function()
				-- upvalues: UseContextResult (copy), v10 (copy)
				return UseContextResult:Format(v10)
			end)
			MomentWasnTPosted = if Success10 and (typeof(Result10) == "string" and Result10 ~= "") then Result10 else "Moment wasn't posted"
		end
		t.failedTitle = MomentWasnTPosted
		local SomethingWentWrongTryAgainLater = nil
		
		if UseContextResult == nil then
			SomethingWentWrongTryAgainLater = "Something went wrong, try again later"
		else
			local v11 = "Feature.Moments.Label.PostFeedbackFailedBody"
			local Success8, Result8 = pcall(function()
				-- upvalues: UseContextResult (copy), v11 (copy)
				return UseContextResult:Format(v11)
			end)
			SomethingWentWrongTryAgainLater = if Success8 and (typeof(Result8) == "string" and Result8 ~= "") then Result8 else "Something went wrong, try again later"
		end
		t.failedBody = SomethingWentWrongTryAgainLater
		local Share = nil
		
		if UseContextResult == nil then
			Share = "Share"
		else
			local v12 = "Feature.SocialShare.Action.Share"
			local Success11, Result11 = pcall(function()
				-- upvalues: UseContextResult (copy), v12 (copy)
				return UseContextResult:Format(v12)
			end)
			Share = if Success11 and (typeof(Result11) == "string" and Result11 ~= "") then Result11 else "Share"
		end
		t.share = Share
		local Dismiss = nil
		
		if UseContextResult == nil then
			Dismiss = "Dismiss"
		else
			local v13 = "CommonUI.Messages.Action.Dismiss"
			local Success12, Result12 = pcall(function()
				-- upvalues: UseContextResult (copy), v13 (copy)
				return UseContextResult:Format(v13)
			end)
			Dismiss = if Success12 and typeof(Result12) == "string" and Result12 ~= "" then Result12 else "Dismiss"
		end
		t.dismiss = Dismiss
		
		return t
	end, { UseContextResult })
end
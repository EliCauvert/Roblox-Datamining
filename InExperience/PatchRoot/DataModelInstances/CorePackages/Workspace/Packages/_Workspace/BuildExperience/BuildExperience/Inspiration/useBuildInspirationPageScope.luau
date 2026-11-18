local Players = game:GetService("Players")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.SduiCoreSystem)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local ChatConstantsModule = require(BuildExperience.Chat.chatConstants)
local _ = require(BuildExperience.Chat.chatTypes)
local GetBuildPromptDraftStoreModule = require(BuildExperience.Stores.GetBuildPromptDraftStore)
local BuildInspirationConstantsModule = require(script.Parent.BuildInspirationConstants)
local BuildInspirationPageScopeFieldsModule = require(script.Parent.BuildInspirationPageScopeFields)
local UsePageScopeRefFunction = SduiSharedUtilitiesModule.usePageScopeRef

local function _(p1, p2, p3)
	-- upvalues: ReactModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), p3 (copy), p2 (copy)
		if p1 == nil or p3 == nil then
			return nil
		else
			p1.set(p2, function()
				-- upvalues: p3 (upval)
				return p3
			end)
			
			return function()
				-- upvalues: p1 (upval), p2 (upval), p3 (upval)
				if p1.get(p2) == p3 then
					p1.set(p2, nil)
				end
			end
		end
	end, { p1, p2, p3 })
end

return function(p1, p2)
	-- upvalues: UsePageScopeRefFunction (copy), ReactModule (copy), GetBuildPromptDraftStoreModule (copy), ChatConstantsModule (copy), Players (copy), BuildInspirationConstantsModule (copy), BuildInspirationPageScopeFieldsModule (copy)
	local UsePageScopeRefResult = UsePageScopeRefFunction(p1)
	local OnOpenChatFunction = p2.onOpenChat
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: OnOpenChatFunction (copy), GetBuildPromptDraftStoreModule (upval), ChatConstantsModule (upval), Players (upval), BuildInspirationConstantsModule (upval)
		return if OnOpenChatFunction == nil then nil else function(Text)
			-- upvalues: GetBuildPromptDraftStoreModule (upval), OnOpenChatFunction (upval), ChatConstantsModule (upval), Players (upval), BuildInspirationConstantsModule (upval)
			GetBuildPromptDraftStoreModule().queueDraft({ text = Text })
			OnOpenChatFunction({
				isNewGameTarget = true,
				experienceName = ChatConstantsModule.BUILD_CHAT_PAGE_TITLE,
				creatorName = if Players.LocalPlayer then Players.LocalPlayer.Name else nil
			}, BuildInspirationConstantsModule.ChatOpenSource)
		end
	end, { OnOpenChatFunction })
	local OpenChatWithPrompt = BuildInspirationPageScopeFieldsModule.OpenChatWithPrompt
	ReactModule.useEffect(function()
		-- upvalues: UsePageScopeRefResult (copy), UseMemoResult (copy), OpenChatWithPrompt (copy)
		if UsePageScopeRefResult == nil or UseMemoResult == nil then
			return nil
		else
			UsePageScopeRefResult.set(OpenChatWithPrompt, function()
				-- upvalues: UseMemoResult (upval)
				return UseMemoResult
			end)
			
			return function()
				-- upvalues: UsePageScopeRefResult (upval), OpenChatWithPrompt (upval), UseMemoResult (upval)
				if UsePageScopeRefResult.get(OpenChatWithPrompt) == UseMemoResult then
					UsePageScopeRefResult.set(OpenChatWithPrompt, nil)
				end
			end
		end
	end, { UsePageScopeRefResult, OpenChatWithPrompt, UseMemoResult })
	local OpenSeeMore = BuildInspirationPageScopeFieldsModule.OpenSeeMore
	local OnOpenSeeMore = p2.onOpenSeeMore
	ReactModule.useEffect(function()
		-- upvalues: UsePageScopeRefResult (copy), OnOpenSeeMore (copy), OpenSeeMore (copy)
		if UsePageScopeRefResult == nil or OnOpenSeeMore == nil then
			return nil
		else
			UsePageScopeRefResult.set(OpenSeeMore, function()
				-- upvalues: OnOpenSeeMore (upval)
				return OnOpenSeeMore
			end)
			
			return function()
				-- upvalues: UsePageScopeRefResult (upval), OpenSeeMore (upval), OnOpenSeeMore (upval)
				if UsePageScopeRefResult.get(OpenSeeMore) == OnOpenSeeMore then
					UsePageScopeRefResult.set(OpenSeeMore, nil)
				end
			end
		end
	end, { UsePageScopeRefResult, OpenSeeMore, OnOpenSeeMore })
end
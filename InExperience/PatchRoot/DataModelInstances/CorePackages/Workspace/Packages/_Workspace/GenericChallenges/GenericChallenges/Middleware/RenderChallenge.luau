local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local _ = require(GenericChallenges.Types.ChallengeParameters)
local BuildHybridCallbackModule = require(script.Parent.BuildHybridCallback)
local GetLocalizedTitleModule = require(GenericChallenges.Utils.getLocalizedTitle)
local ChallengeWebViewModule = require(script.Parent.ChallengeWebView)
local ChallengeErrorModule = require(script.Parent.ChallengeError)
local InitializeHybridCallbackModule = require(script.Parent.InitializeHybridCallback)
local ConstantsModule = require(GenericChallenges.Utils.constants)
local BuildCredentialsProtocolHookModule = require(script.Parent.Hooks.BuildCredentialsProtocolHook)
local ErrorKindModule = require(GenericChallenges.Types.ErrorKind)
local CompletionDataToRawHeadersModule = require(GenericChallenges.Utils.completionDataToRawHeaders)
local EnableRejectPromiseOnWebviewClosed = game:DefineFastFlag("EnableRejectPromiseOnWebviewClosed", false)
local _ = require(GenericChallenges.Parent.LuauPolyfill)

return function(p1) --[[ Line: 41 ]]
	-- upvalues: ChallengeWebViewModule (copy), GetLocalizedTitleModule (copy), EnableRejectPromiseOnWebviewClosed (copy), ConstantsModule (copy), BuildHybridCallbackModule (copy), BuildCredentialsProtocolHookModule (copy), ChallengeErrorModule (copy), ErrorKindModule (copy), CompletionDataToRawHeadersModule (copy), InitializeHybridCallbackModule (copy)
	if p1.rawResponseHeaders == nil then
		assert(p1.callbacks ~= nil, "Callbacks must be specified in manual challenge mode")
		assert(p1.challengeParameters ~= nil, "Challenge parameters must be specified in manual challenge mode")
		assert(p1.challengeType ~= nil, "Challenge type must be specified in manual challenge mode")
		local NewChallengeWebView1 = ChallengeWebViewModule.new({
			title = GetLocalizedTitleModule(p1.title),
			challengeType = p1.challengeType,
			challengeParameters = p1.challengeParameters,
			modal = p1.renderWebViewInModal
		})
		local Flag = false
		NewChallengeWebView1:setHybridCallback(BuildHybridCallbackModule({
			Hooks = { BuildCredentialsProtocolHookModule() },
			OnChallengeLoadFailed = function(p2) --[[ Line: 131 ]]
				-- upvalues: p1 (copy), NewChallengeWebView1 (copy)
				p1.callbacks.OnChallengeLoadFailed(p2)
				NewChallengeWebView1:close()
			end,
			OnChallengeInvalidated = function(p2) --[[ Line: 135 ]]
				-- upvalues: p1 (copy), NewChallengeWebView1 (copy)
				p1.callbacks.OnChallengeInvalidated(p2)
				NewChallengeWebView1:close()
			end,
			OnChallengeCompleted = function(p2) --[[ Line: 139 ]]
				-- upvalues: Flag (ref), p1 (copy), NewChallengeWebView1 (copy)
				Flag = true
				p1.callbacks.OnChallengeCompleted(p2)
				NewChallengeWebView1:close()
			end
		}))
		NewChallengeWebView1:setCloseCallback(function() --[[ Line: 145 ]]
			-- upvalues: Flag (ref), p1 (copy)
			if not Flag and p1.callbacks.OnChallengeAbandoned ~= nil then
				p1.callbacks.OnChallengeAbandoned()
			end
		end)
		
		if p1.onWebViewOpen ~= nil then
			NewChallengeWebView1:setOpenCallback(p1.onWebViewOpen)
		end
		NewChallengeWebView1:open()
		
		return
	else
		assert(p1.retryRequestCallback ~= nil, "Retry request callback must be defined for generic handling")
		assert(p1.resolve ~= nil, "Promise resolution method must be provided for generic handling")
		assert(p1.reject ~= nil, "Promise rejection method must be provided for generic handling")
		local NewChallengeWebView = ChallengeWebViewModule.new({
			title = GetLocalizedTitleModule(p1.title),
			rawResponseHeaders = p1.rawResponseHeaders,
			modal = p1.renderWebViewInModal
		})
		
		if EnableRejectPromiseOnWebviewClosed then
			local RawResponseHeader = p1.rawResponseHeaders[ConstantsModule.challengeTypeHeader]
			local RawResponseHeader1 = p1.rawResponseHeaders[ConstantsModule.challengeIdHeader]
			local Flag1 = false
			NewChallengeWebView:setHybridCallback(BuildHybridCallbackModule({
				Hooks = { BuildCredentialsProtocolHookModule() },
				OnChallengeLoadFailed = function(_) --[[ Line: 61 ]]
					-- upvalues: p1 (copy), ChallengeErrorModule (upval), ErrorKindModule (upval), RawResponseHeader (copy), NewChallengeWebView (copy)
					if p1.challengeErrorCallback ~= nil then
						p1.challengeErrorCallback()
					end
					p1.reject(ChallengeErrorModule.new(ErrorKindModule.LoadFailed, { challengeType = RawResponseHeader }))
					NewChallengeWebView:close()
				end,
				OnChallengeInvalidated = function(p2) --[[ Line: 70 ]]
					-- upvalues: p1 (copy), ChallengeErrorModule (upval), ErrorKindModule (upval), NewChallengeWebView (copy)
					if p1.challengeErrorCallback ~= nil and p2.data ~= nil then
						p1.challengeErrorCallback(p2.data)
					end
					p1.reject(ChallengeErrorModule.new(ErrorKindModule.Invalidated, p2.data))
					NewChallengeWebView:close()
				end,
				OnChallengeDisplayed = function(_) --[[ Line: 77 ]]
					-- upvalues: NewChallengeWebView (copy)
					NewChallengeWebView:setVisible(true)
				end,
				OnChallengeCompleted = function(p2) --[[ Line: 80 ]]
					-- upvalues: p1 (copy), CompletionDataToRawHeadersModule (upval), RawResponseHeader1 (copy), Flag1 (ref), NewChallengeWebView (copy)
					if p2.data ~= nil and p2.data.challengeType ~= nil and p2.data.metadata ~= nil then
						p1.resolve(p1.retryRequestCallback(CompletionDataToRawHeadersModule({
							challengeId = RawResponseHeader1,
							challengeType = p2.data.challengeType,
							metadata = p2.data.metadata
						})))
					end
					Flag1 = true
					NewChallengeWebView:close()
				end
			}))
			NewChallengeWebView:setCloseCallback(function() --[[ Line: 94 ]]
				-- upvalues: Flag1 (ref), p1 (copy), ChallengeErrorModule (upval), ErrorKindModule (upval), RawResponseHeader (copy)
				if not Flag1 then
					p1.reject(ChallengeErrorModule.new(ErrorKindModule.Invalidated, { challengeType = RawResponseHeader }))
				end
			end)
		else
			NewChallengeWebView:setHybridCallback(InitializeHybridCallbackModule(p1.rawResponseHeaders[ConstantsModule.challengeIdHeader], p1.rawResponseHeaders[ConstantsModule.challengeTypeHeader], NewChallengeWebView, p1.retryRequestCallback, p1.challengeErrorCallback, p1.resolve, p1.reject))
		end
		NewChallengeWebView:open()
	end
end
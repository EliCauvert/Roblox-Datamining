local genericChallenges = script:FindFirstAncestor("GenericChallenges")
local _ = require(genericChallenges.Types.ChallengeParameters)
local buildHybridCallbackModule = require(script.Parent.BuildHybridCallback)
local getLocalizedTitleModule = require(genericChallenges.Utils.getLocalizedTitle)
local challengeWebViewModule = require(script.Parent.ChallengeWebView)
local challengeErrorModule = require(script.Parent.ChallengeError)
local initializeHybridCallbackModule = require(script.Parent.InitializeHybridCallback)
local constantsModule = require(genericChallenges.Utils.constants)
local buildCredentialsProtocolHookModule = require(script.Parent.Hooks.BuildCredentialsProtocolHook)
local errorKindModule = require(genericChallenges.Types.ErrorKind)
local completionDataToRawHeadersModule = require(genericChallenges.Utils.completionDataToRawHeaders)
local enableRejectPromiseOnWebviewClosed = game:DefineFastFlag("EnableRejectPromiseOnWebviewClosed", false)
local _ = require(genericChallenges.Parent.LuauPolyfill)

return function(p1)
	-- upvalues: challengeWebViewModule (ref), getLocalizedTitleModule (ref), enableRejectPromiseOnWebviewClosed (ref), constantsModule (ref), buildHybridCallbackModule (ref), buildCredentialsProtocolHookModule (ref), challengeErrorModule (ref), errorKindModule (ref), completionDataToRawHeadersModule (ref), initializeHybridCallbackModule (ref)
	if p1.rawResponseHeaders == nil then
		assert(p1.callbacks ~= nil, "Callbacks must be specified in manual challenge mode")
		assert(p1.challengeParameters ~= nil, "Challenge parameters must be specified in manual challenge mode")
		assert(p1.challengeType ~= nil, "Challenge type must be specified in manual challenge mode")
		local var1 = challengeWebViewModule.new({
			title = getLocalizedTitleModule(p1.title),
			challengeType = p1.challengeType,
			challengeParameters = p1.challengeParameters,
			modal = p1.renderWebViewInModal
		})
		local var2 = false
		var1:setHybridCallback(buildHybridCallbackModule({
			Hooks = { buildCredentialsProtocolHookModule() },
			OnChallengeLoadFailed = function(p2)
				-- upvalues: p1 (ref), var1 (ref)
				p1.callbacks.OnChallengeLoadFailed(p2)
				var1:close()
			end,
			OnChallengeInvalidated = function(p2)
				-- upvalues: p1 (ref), var1 (ref)
				p1.callbacks.OnChallengeInvalidated(p2)
				var1:close()
			end,
			OnChallengeCompleted = function(p2)
				-- upvalues: var2 (write), p1 (ref), var1 (ref)
				var2 = true
				p1.callbacks.OnChallengeCompleted(p2)
				var1:close()
			end
		}))
		var1:setCloseCallback(function()
			-- upvalues: var2 (write), p1 (ref)
			if not var2 and p1.callbacks.OnChallengeAbandoned ~= nil then
				p1.callbacks.OnChallengeAbandoned()
			end
		end)
		
		if p1.onWebViewOpen ~= nil then
			var1:setOpenCallback(p1.onWebViewOpen)
		end
		var1:open()
		
		return
	else
		assert(p1.retryRequestCallback ~= nil, "Retry request callback must be defined for generic handling")
		assert(p1.resolve ~= nil, "Promise resolution method must be provided for generic handling")
		assert(p1.reject ~= nil, "Promise rejection method must be provided for generic handling")
		local var3 = challengeWebViewModule.new({
			title = getLocalizedTitleModule(p1.title),
			rawResponseHeaders = p1.rawResponseHeaders,
			modal = p1.renderWebViewInModal
		})
		
		if enableRejectPromiseOnWebviewClosed then
			local challengeTypeHeader = p1.rawResponseHeaders[constantsModule.challengeTypeHeader]
			local challengeIdHeader = p1.rawResponseHeaders[constantsModule.challengeIdHeader]
			local var4 = false
			var3:setHybridCallback(buildHybridCallbackModule({
				Hooks = { buildCredentialsProtocolHookModule() },
				OnChallengeLoadFailed = function(_)
					-- upvalues: p1 (ref), challengeErrorModule (copy), errorKindModule (copy), challengeTypeHeader (ref), var3 (ref)
					if p1.challengeErrorCallback ~= nil then
						p1.challengeErrorCallback()
					end
					p1.reject(challengeErrorModule.new(errorKindModule.LoadFailed, { challengeType = challengeTypeHeader }))
					var3:close()
				end,
				OnChallengeInvalidated = function(p2)
					-- upvalues: p1 (ref), challengeErrorModule (copy), errorKindModule (copy), var3 (ref)
					if p1.challengeErrorCallback ~= nil and p2.data ~= nil then
						p1.challengeErrorCallback(p2.data)
					end
					p1.reject(challengeErrorModule.new(errorKindModule.Invalidated, p2.data))
					var3:close()
				end,
				OnChallengeDisplayed = function(_)
					-- upvalues: var3 (ref)
					var3:setVisible(true)
				end,
				OnChallengeCompleted = function(p2)
					-- upvalues: p1 (ref), completionDataToRawHeadersModule (copy), challengeIdHeader (ref), var4 (write), var3 (ref)
					if p2.data ~= nil and p2.data.challengeType ~= nil and p2.data.metadata ~= nil then
						p1.resolve(p1.retryRequestCallback(completionDataToRawHeadersModule({
							challengeId = challengeIdHeader,
							challengeType = p2.data.challengeType,
							metadata = p2.data.metadata
						})))
					end
					var4 = true
					var3:close()
				end
			}))
			var3:setCloseCallback(function()
				-- upvalues: var4 (write), p1 (ref), challengeErrorModule (copy), errorKindModule (copy), challengeTypeHeader (ref)
				if not var4 then
					p1.reject(challengeErrorModule.new(errorKindModule.Invalidated, { challengeType = challengeTypeHeader }))
				end
			end)
		else
			var3:setHybridCallback(initializeHybridCallbackModule(p1.rawResponseHeaders[constantsModule.challengeIdHeader], p1.rawResponseHeaders[constantsModule.challengeTypeHeader], var3, p1.retryRequestCallback, p1.challengeErrorCallback, p1.resolve, p1.reject))
		end
		var3:open()
	end
end
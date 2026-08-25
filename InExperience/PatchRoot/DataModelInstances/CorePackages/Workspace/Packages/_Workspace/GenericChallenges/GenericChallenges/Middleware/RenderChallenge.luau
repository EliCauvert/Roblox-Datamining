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

return function(p0)
	-- upvalues: challengeWebViewModule (ref), getLocalizedTitleModule (ref), enableRejectPromiseOnWebviewClosed (ref), constantsModule (ref), buildHybridCallbackModule (ref), buildCredentialsProtocolHookModule (ref), challengeErrorModule (ref), errorKindModule (ref), completionDataToRawHeadersModule (ref), initializeHybridCallbackModule (ref)
	if p0.rawResponseHeaders == nil then
		assert(p0.callbacks ~= nil, "Callbacks must be specified in manual challenge mode")
		assert(p0.challengeParameters ~= nil, "Challenge parameters must be specified in manual challenge mode")
		assert(p0.challengeType ~= nil, "Challenge type must be specified in manual challenge mode")
		local var13 = challengeWebViewModule.new({
			title = getLocalizedTitleModule(p0.title),
			challengeType = p0.challengeType,
			challengeParameters = p0.challengeParameters,
			modal = p0.renderWebViewInModal
		})
		local var14 = false
		var13:setHybridCallback(buildHybridCallbackModule({
			Hooks = { buildCredentialsProtocolHookModule() },
			OnChallengeLoadFailed = function(p1)
				-- upvalues: p0 (ref), var13 (ref)
				p0.callbacks.OnChallengeLoadFailed(p1)
				var13:close()
			end,
			OnChallengeInvalidated = function(p2)
				-- upvalues: p0 (ref), var13 (ref)
				p0.callbacks.OnChallengeInvalidated(p2)
				var13:close()
			end,
			OnChallengeCompleted = function(p3)
				-- upvalues: var14 (write), p0 (ref), var13 (ref)
				var14 = true
				p0.callbacks.OnChallengeCompleted(p3)
				var13:close()
			end
		}))
		var13:setCloseCallback(function()
			-- upvalues: var14 (write), p0 (ref)
			if not var14 and p0.callbacks.OnChallengeAbandoned ~= nil then
				p0.callbacks.OnChallengeAbandoned()
			end
		end)
		
		if p0.onWebViewOpen ~= nil then
			var13:setOpenCallback(p0.onWebViewOpen)
		end
		var13:open()
		
		return
	else
		assert(p0.retryRequestCallback ~= nil, "Retry request callback must be defined for generic handling")
		assert(p0.resolve ~= nil, "Promise resolution method must be provided for generic handling")
		assert(p0.reject ~= nil, "Promise rejection method must be provided for generic handling")
		local var11 = challengeWebViewModule.new({
			title = getLocalizedTitleModule(p0.title),
			rawResponseHeaders = p0.rawResponseHeaders,
			modal = p0.renderWebViewInModal
		})
		
		if enableRejectPromiseOnWebviewClosed then
			local challengeTypeHeader = p0.rawResponseHeaders[constantsModule.challengeTypeHeader]
			local challengeIdHeader = p0.rawResponseHeaders[constantsModule.challengeIdHeader]
			local var12 = false
			var11:setHybridCallback(buildHybridCallbackModule({
				Hooks = { buildCredentialsProtocolHookModule() },
				OnChallengeLoadFailed = function(_)
					-- upvalues: p0 (ref), challengeErrorModule (copy), errorKindModule (copy), challengeTypeHeader (ref), var11 (ref)
					if p0.challengeErrorCallback ~= nil then
						p0.challengeErrorCallback()
					end
					p0.reject(challengeErrorModule.new(errorKindModule.LoadFailed, { challengeType = challengeTypeHeader }))
					var11:close()
				end,
				OnChallengeInvalidated = function(p4)
					-- upvalues: p0 (ref), challengeErrorModule (copy), errorKindModule (copy), var11 (ref)
					if p0.challengeErrorCallback ~= nil and p4.data ~= nil then
						p0.challengeErrorCallback(p4.data)
					end
					p0.reject(challengeErrorModule.new(errorKindModule.Invalidated, p4.data))
					var11:close()
				end,
				OnChallengeCompleted = function(p5)
					-- upvalues: p0 (ref), completionDataToRawHeadersModule (copy), challengeIdHeader (ref), var12 (write), var11 (ref)
					if p5.data ~= nil and p5.data.challengeType ~= nil and p5.data.metadata ~= nil then
						p0.resolve(p0.retryRequestCallback(completionDataToRawHeadersModule({
							challengeId = challengeIdHeader,
							challengeType = p5.data.challengeType,
							metadata = p5.data.metadata
						})))
					end
					var12 = true
					var11:close()
				end
			}))
			var11:setCloseCallback(function()
				-- upvalues: var12 (write), p0 (ref), challengeErrorModule (copy), errorKindModule (copy), challengeTypeHeader (ref)
				if not var12 then
					p0.reject(challengeErrorModule.new(errorKindModule.Invalidated, { challengeType = challengeTypeHeader }))
				end
			end)
		else
			var11:setHybridCallback(initializeHybridCallbackModule(p0.rawResponseHeaders[constantsModule.challengeIdHeader], p0.rawResponseHeaders[constantsModule.challengeTypeHeader], var11, p0.retryRequestCallback, p0.challengeErrorCallback, p0.resolve, p0.reject))
		end
		var11:open()
	end
end
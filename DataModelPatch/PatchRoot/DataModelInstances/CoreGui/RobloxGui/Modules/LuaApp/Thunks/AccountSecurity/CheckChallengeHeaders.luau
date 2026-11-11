local HttpService = game:GetService("HttpService")
local Logging = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Logging
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Base64Module = require(Modules.LuaApp.Util.Base64)
local ChallengeErrorModule = require(Modules.LuaApp.Util.ChallengeError)
local TypeModule = require(Modules.LuaApp.Enum.Challenge.Type)
local GenericTypeModule = require(Modules.LuaApp.Enum.Challenge.GenericType)
local ErrorKindModule = require(Modules.LuaApp.Enum.Challenge.ErrorKind)
local DeniedReasonModule = require(Modules.LuaApp.Enum.Challenge.DeniedReason)
local GetFFlagLuaAppChallengeDisableForceWebViewVisibleModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppChallengeDisableForceWebViewVisible)
local GetFFlagLuaAppChallengeCaptchaV2ForceWebViewVisibleModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppChallengeCaptchaV2ForceWebViewVisible)
local GetFFlagLuaAppChallengeTurnstileForceWebViewVisibleModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppChallengeTurnstileForceWebViewVisible)
local PromiseModule = require(Modules.LuaApp.Promise)
local RenderChallengeModule = require(Modules.LuaApp.Thunks.Challenge.RenderChallenge)
local RenderNativeChallengeModule = require(Modules.LuaApp.Thunks.Challenge.RenderNativeChallenge)
local GetFFlagEnableNativeToWebviewMiddlewareModule = require(Modules.LuaApp.Flags.GetFFlagEnableNativeToWebviewMiddleware)
local GetFFlagEnableBypassNavigationLockHybridWebviewModule = require(Modules.LuaApp.Flags.GetFFlagEnableBypassNavigationLockHybridWebview)
local GetFFlagChallengeInterceptorResolveOriginalNetworkImplModule = require(Modules.LuaApp.Flags.GetFFlagChallengeInterceptorResolveOriginalNetworkImpl)

function shouldForceWebViewVisibleForChallengeType(p1)
	-- upvalues: GenericTypeModule (copy), GetFFlagLuaAppChallengeCaptchaV2ForceWebViewVisibleModule (copy), GetFFlagLuaAppChallengeTurnstileForceWebViewVisibleModule (copy)
	local FromRawValueResult = GenericTypeModule.fromRawValue(p1)
	
	return FromRawValueResult ~= nil and (FromRawValueResult ~= GenericTypeModule.Captcha and (FromRawValueResult ~= GenericTypeModule.ProofOfWork and (FromRawValueResult ~= GenericTypeModule.DeviceIntegrity and (FromRawValueResult ~= GenericTypeModule.PrivateAccessToken and (FromRawValueResult ~= GenericTypeModule.Biometric and (if GetFFlagLuaAppChallengeCaptchaV2ForceWebViewVisibleModule() then GetFFlagLuaAppChallengeTurnstileForceWebViewVisibleModule() or FromRawValueResult ~= GenericTypeModule.Turnstile else FromRawValueResult ~= GenericTypeModule.CaptchaV2 and (GetFFlagLuaAppChallengeTurnstileForceWebViewVisibleModule() or FromRawValueResult ~= GenericTypeModule.Turnstile)))))))
end

function shouldRenderNativeChallenge(Input): boolean
	-- upvalues: HttpService (copy)
	local Data = HttpService:JSONDecode(Input)
	
	return Data ~= nil and (Data.sharedParameters ~= nil and Data.sharedParameters.renderNativeChallenge == true)
end

function renderChallengeWithHeaders(Callback, p1, p2, p3, p4)
	-- upvalues: PromiseModule (copy), GenericTypeModule (copy), Base64Module (copy), HttpService (copy), DeniedReasonModule (copy), ChallengeErrorModule (copy), ErrorKindModule (copy), Logging (copy), RenderNativeChallengeModule (copy), GetFFlagChallengeInterceptorResolveOriginalNetworkImplModule (copy), GetFFlagEnableNativeToWebviewMiddlewareModule (copy), RenderChallengeModule (copy), TypeModule (copy), GetFFlagLuaAppChallengeDisableForceWebViewVisibleModule (copy), GetFFlagEnableBypassNavigationLockHybridWebviewModule (copy)
	return function(p5)
		-- upvalues: p4 (copy), PromiseModule (upval), GenericTypeModule (upval), Base64Module (upval), HttpService (upval), DeniedReasonModule (upval), ChallengeErrorModule (upval), ErrorKindModule (upval), Logging (upval), RenderNativeChallengeModule (upval), p3 (ref), GetFFlagChallengeInterceptorResolveOriginalNetworkImplModule (upval), Callback (copy), p1 (copy), p2 (copy), GetFFlagEnableNativeToWebviewMiddlewareModule (upval), RenderChallengeModule (upval), TypeModule (upval), GetFFlagLuaAppChallengeDisableForceWebViewVisibleModule (upval), GetFFlagEnableBypassNavigationLockHybridWebviewModule (upval)
		if p4 == nil then
			return PromiseModule.resolve()
		elseif type(p4.Headers) ~= "table" or not p4.Headers["rblx-challenge-type"] or not p4.Headers["rblx-challenge-metadata"] or not p4.Headers["rblx-challenge-id"] then
			return PromiseModule.reject(p4)
		else
			local FromRawValueResult = GenericTypeModule.fromRawValue(p4.Headers["rblx-challenge-type"])
			local DecodeResult = Base64Module.Decode(p4.Headers["rblx-challenge-metadata"])
			local Data = HttpService:JSONDecode(DecodeResult)
			
			if FromRawValueResult == GenericTypeModule.Denied and Data and Data.reason == DeniedReasonModule.toRawValue(DeniedReasonModule.RateLimited) and Data.rateLimited and Data.rateLimited.retryTime then
				return PromiseModule.reject(ChallengeErrorModule:new(ErrorKindModule.RateLimited, Data.rateLimited))
			elseif shouldRenderNativeChallenge(DecodeResult) then
				Logging.warn("Rendering native challenge.")
				
				return PromiseModule.new(function(Callback1, Callback2)
					-- upvalues: p5 (copy), RenderNativeChallengeModule (upval), p4 (upval), FromRawValueResult (copy), DecodeResult (copy), p3 (upval), GetFFlagChallengeInterceptorResolveOriginalNetworkImplModule (upval), Callback (upval), p1 (upval), p2 (upval), ChallengeErrorModule (upval), ErrorKindModule (upval), GetFFlagEnableNativeToWebviewMiddlewareModule (upval), Logging (upval), RenderChallengeModule (upval), TypeModule (upval), Base64Module (upval), HttpService (upval), GenericTypeModule (upval), GetFFlagLuaAppChallengeDisableForceWebViewVisibleModule (upval), GetFFlagEnableBypassNavigationLockHybridWebviewModule (upval)
					p5:dispatch(RenderNativeChallengeModule({
						challengeId = p4.Headers["rblx-challenge-id"],
						challengeType = FromRawValueResult,
						challengeMetadata = DecodeResult,
						onSessionCompleted = function()
							-- upvalues: p3 (upval), p4 (upval), GetFFlagChallengeInterceptorResolveOriginalNetworkImplModule (upval), Callback1 (copy), Callback (upval), p1 (upval), p2 (upval), Callback2 (copy), ChallengeErrorModule (upval), ErrorKindModule (upval), FromRawValueResult (upval)
							p3 = if type(p3) == "table" then p3 else {}
							p3.headers = if type(p3.headers) == "table" then p3.headers else {}
							p3.headers["rblx-challenge-id"] = p4.Headers["rblx-challenge-id"]
							p3.headers["rblx-challenge-type"] = p4.Headers["rblx-challenge-type"]
							p3.headers["rblx-challenge-metadata"] = p4.Headers["rblx-challenge-metadata"]
							
							if GetFFlagChallengeInterceptorResolveOriginalNetworkImplModule() then
								Callback1(Callback(p1, p2, p3))
								
								return
							else
								local v1, _ = Callback(p1, p2, p3):andThen(nil, function(_)
									-- upvalues: Callback2 (upval), ChallengeErrorModule (upval), ErrorKindModule (upval), FromRawValueResult (upval)
									Callback2(ChallengeErrorModule:new(ErrorKindModule.Invalidated, { challengeType = FromRawValueResult }))
								end)
								Callback1(v1)
							end
						end,
						onSessionFailed = function()
							-- upvalues: Callback2 (copy), ChallengeErrorModule (upval), ErrorKindModule (upval), FromRawValueResult (upval)
							Callback2(ChallengeErrorModule:new(ErrorKindModule.Invalidated, { challengeType = FromRawValueResult }))
						end,
						onSessionAbandoned = function()
							-- upvalues: Callback2 (copy), ChallengeErrorModule (upval), ErrorKindModule (upval), FromRawValueResult (upval)
							Callback2(ChallengeErrorModule:new(ErrorKindModule.Abandoned, { challengeType = FromRawValueResult }))
						end,
						onWebViewChallengeIssued = if GetFFlagEnableNativeToWebviewMiddlewareModule() then function(GenericChallengeType, Input)
							-- upvalues: Logging (upval), p5 (upval), RenderChallengeModule (upval), TypeModule (upval), p4 (upval), Base64Module (upval), p3 (upval), HttpService (upval), GetFFlagChallengeInterceptorResolveOriginalNetworkImplModule (upval), Callback1 (copy), Callback (upval), p1 (upval), p2 (upval), Callback2 (copy), ChallengeErrorModule (upval), ErrorKindModule (upval), FromRawValueResult (upval), GenericTypeModule (upval), GetFFlagLuaAppChallengeDisableForceWebViewVisibleModule (upval), GetFFlagEnableBypassNavigationLockHybridWebviewModule (upval)
							Logging.warn("Rendering generic web challenge.")
							p5:dispatch(RenderChallengeModule({
								challengeType = TypeModule.Generic,
								challengeParameters = {
									genericChallengeId = p4.Headers["rblx-challenge-id"],
									genericChallengeType = GenericChallengeType,
									genericChallengeMetadata = Base64Module.EncodeUrl(Input),
									onChallengeCompleted = function(_)
										-- upvalues: p3 (upval), p4 (upval), GenericChallengeType (copy), Base64Module (upval), HttpService (upval), Input (copy), GetFFlagChallengeInterceptorResolveOriginalNetworkImplModule (upval), Callback1 (upval), Callback (upval), p1 (upval), p2 (upval), Callback2 (upval), ChallengeErrorModule (upval), ErrorKindModule (upval), FromRawValueResult (upval)
										p3 = if type(p3) == "table" then p3 else {}
										p3.headers = if type(p3.headers) == "table" then p3.headers else {}
										p3.headers["rblx-challenge-id"] = p4.Headers["rblx-challenge-id"]
										p3.headers["rblx-challenge-type"] = GenericChallengeType
										p3.headers["rblx-challenge-metadata"] = Base64Module.Encode(HttpService:JSONEncode(Input))
										
										if GetFFlagChallengeInterceptorResolveOriginalNetworkImplModule() then
											Callback1(Callback(p1, p2, p3))
											
											return
										else
											local v1, _ = Callback(p1, p2, p3):andThen(nil, function(_)
												-- upvalues: Callback2 (upval), ChallengeErrorModule (upval), ErrorKindModule (upval), FromRawValueResult (upval)
												Callback2(ChallengeErrorModule:new(ErrorKindModule.Invalidated, { challengeType = FromRawValueResult }))
											end)
											Callback1(v1)
										end
									end,
									onChallengeInvalidated = function(p6)
										-- upvalues: GenericTypeModule (upval), Callback2 (upval), ChallengeErrorModule (upval), ErrorKindModule (upval), GenericChallengeType (copy)
										if p6 and p6.challengeType then
											p6.challengeType = GenericTypeModule.fromRawValue((tostring(p6.challengeType)))
											Callback2(ChallengeErrorModule:new(ErrorKindModule.Invalidated, p6))
											
											return
										else
											Callback2(ChallengeErrorModule:new(ErrorKindModule.Invalidated, {
												challengeType = GenericTypeModule.fromRawValue(GenericChallengeType)
											}))
										end
									end
								},
								onChallengeAbandoned = function()
									-- upvalues: Callback2 (upval), ChallengeErrorModule (upval), ErrorKindModule (upval), GenericTypeModule (upval), GenericChallengeType (copy)
									Callback2(ChallengeErrorModule:new(ErrorKindModule.Abandoned, {
										challengeType = GenericTypeModule.fromRawValue(GenericChallengeType)
									}))
								end,
								onChallengeLoadFailed = function()
									-- upvalues: Logging (upval), Callback2 (upval), ChallengeErrorModule (upval), ErrorKindModule (upval), GenericTypeModule (upval), GenericChallengeType (copy)
									Logging.warn("Load generic challenge failed.")
									Callback2(ChallengeErrorModule:new(ErrorKindModule.LoadFailed, {
										challengeType = GenericTypeModule.fromRawValue(GenericChallengeType)
									}))
								end,
								forceWebViewVisible = not GetFFlagLuaAppChallengeDisableForceWebViewVisibleModule() or shouldForceWebViewVisibleForChallengeType(GenericChallengeType)
							}, false, GetFFlagEnableBypassNavigationLockHybridWebviewModule()))
						end else nil
					}))
				end)
			else
				Logging.warn("Rendering generic challenge.")
				
				return PromiseModule.new(function(Callback1, Callback2)
					-- upvalues: p5 (copy), RenderChallengeModule (upval), TypeModule (upval), p4 (upval), Base64Module (upval), DecodeResult (copy), p3 (upval), HttpService (upval), Callback (upval), p1 (upval), p2 (upval), GenericTypeModule (upval), ChallengeErrorModule (upval), ErrorKindModule (upval), Logging (upval), GetFFlagLuaAppChallengeDisableForceWebViewVisibleModule (upval)
					p5:dispatch(RenderChallengeModule({
						challengeType = TypeModule.Generic,
						challengeParameters = {
							genericChallengeId = p4.Headers["rblx-challenge-id"],
							genericChallengeType = p4.Headers["rblx-challenge-type"],
							genericChallengeMetadata = Base64Module.EncodeUrl(DecodeResult),
							onChallengeCompleted = function(p6)
								-- upvalues: p3 (upval), p4 (upval), Base64Module (upval), HttpService (upval), Callback (upval), p1 (upval), p2 (upval), p5 (upval), Callback1 (copy)
								p3 = if type(p3) == "table" then p3 else {}
								p3.headers = if type(p3.headers) == "table" then p3.headers else {}
								p3.headers["rblx-challenge-id"] = p4.Headers["rblx-challenge-id"]
								p3.headers["rblx-challenge-type"] = p4.Headers["rblx-challenge-type"]
								p3.headers["rblx-challenge-metadata"] = Base64Module.Encode(HttpService:JSONEncode(p6.metadata))
								local CallbackResult, _ = Callback(p1, p2, p3)
								Callback1((CallbackResult:andThen(nil, function(p7)
									-- upvalues: p5 (upval), Callback (upval), p1 (upval), p2 (upval), p3 (upval)
									return p5:dispatch(renderChallengeWithHeaders(Callback, p1, p2, p3, p7))
								end)))
							end,
							onChallengeInvalidated = function(p6)
								-- upvalues: GenericTypeModule (upval), Callback2 (copy), ChallengeErrorModule (upval), ErrorKindModule (upval), p4 (upval)
								if p6 and p6.challengeType then
									p6.challengeType = GenericTypeModule.fromRawValue((tostring(p6.challengeType)))
									Callback2(ChallengeErrorModule:new(ErrorKindModule.Invalidated, p6))
									
									return
								else
									Callback2(ChallengeErrorModule:new(ErrorKindModule.Invalidated, {
										challengeType = GenericTypeModule.fromRawValue(p4.Headers["rblx-challenge-type"])
									}))
								end
							end
						},
						onChallengeAbandoned = function()
							-- upvalues: Callback2 (copy), ChallengeErrorModule (upval), ErrorKindModule (upval), GenericTypeModule (upval), p4 (upval)
							Callback2(ChallengeErrorModule:new(ErrorKindModule.Abandoned, {
								challengeType = GenericTypeModule.fromRawValue(p4.Headers["rblx-challenge-type"])
							}))
						end,
						onChallengeLoadFailed = function()
							-- upvalues: Logging (upval), Callback2 (copy), ChallengeErrorModule (upval), ErrorKindModule (upval), GenericTypeModule (upval), p4 (upval)
							Logging.warn("Load generic challenge failed.")
							Callback2(ChallengeErrorModule:new(ErrorKindModule.LoadFailed, {
								challengeType = GenericTypeModule.fromRawValue(p4.Headers["rblx-challenge-type"])
							}))
						end,
						forceWebViewVisible = not GetFFlagLuaAppChallengeDisableForceWebViewVisibleModule() or shouldForceWebViewVisibleForChallengeType(p4.Headers["rblx-challenge-type"])
					}, false))
				end)
			end
		end
	end
end

return renderChallengeWithHeaders
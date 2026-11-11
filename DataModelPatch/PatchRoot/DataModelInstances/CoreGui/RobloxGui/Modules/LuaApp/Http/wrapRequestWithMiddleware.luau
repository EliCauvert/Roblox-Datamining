local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CheckHttpErrorStatusModule = require(Modules.LuaApp.Thunks.CheckHttpErrorStatus)
local CheckChallengeHeadersModule = require(Modules.LuaApp.Thunks.AccountSecurity.CheckChallengeHeaders)
local GetFFlagLuaAppAttachChallengeInterceptorModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppAttachChallengeInterceptor)
local SilentlyFailIfChallenge = game:DefineFastFlag("SilentlyFailIfChallenge", true)

local function _(p1, p2)
	-- upvalues: CheckChallengeHeadersModule (copy)
	return function(p3, p4, p5)
		-- upvalues: p1 (copy), p2 (copy), CheckChallengeHeadersModule (upval)
		local Promise, v1 = p1(p3, p4, p5)
		
		return Promise:andThen(nil, function(p6)
			-- upvalues: p2 (upval), CheckChallengeHeadersModule (upval), p1 (upval), p3 (copy), p4 (copy), p5 (copy)
			return p2:dispatch(CheckChallengeHeadersModule(p1, p3, p4, p5, p6))
		end), v1
	end
end

return function(Callback, p1, p2)
	-- upvalues: SilentlyFailIfChallenge (copy), GetFFlagLuaAppAttachChallengeInterceptorModule (copy), CheckHttpErrorStatusModule (copy), CheckChallengeHeadersModule (copy)
	return function(p3, p4, p5, p6)
		-- upvalues: Callback (copy), SilentlyFailIfChallenge (upval), GetFFlagLuaAppAttachChallengeInterceptorModule (upval), p1 (copy), CheckHttpErrorStatusModule (upval), CheckChallengeHeadersModule (upval), p2 (copy)
		local CallbackResult, CallbackResult2 = Callback(p3, p4, p5)
		
		if SilentlyFailIfChallenge and p6 then
			return CallbackResult, CallbackResult2
		else
			return CallbackResult:andThen(nil, function(p7)
				-- upvalues: GetFFlagLuaAppAttachChallengeInterceptorModule (upval), p1 (upval), CheckHttpErrorStatusModule (upval), Callback (upval), CheckChallengeHeadersModule (upval), p3 (copy), p2 (upval)
				return if GetFFlagLuaAppAttachChallengeInterceptorModule() then p1:dispatch(CheckHttpErrorStatusModule(function(p8, p9, p10)
					-- upvalues: Callback (copy), p1 (copy), CheckChallengeHeadersModule (upval)
					local Promise, v1 = Callback(p8, p9, p10)
					
					return Promise:andThen(nil, function(p11)
						-- upvalues: p1 (upval), CheckChallengeHeadersModule (upval), Callback (upval), p8 (copy), p9 (copy), p10 (copy)
						return p1:dispatch(CheckChallengeHeadersModule(Callback, p8, p9, p10, p11))
					end), v1
				end, p3, p7, p2)) else p1:dispatch(CheckHttpErrorStatusModule(Callback, p3, p7, p2))
			end):andThen(nil, function(p7)
				-- upvalues: p1 (upval), CheckChallengeHeadersModule (upval), Callback (upval), p3 (copy), p4 (copy), p5 (copy)
				return p1:dispatch(CheckChallengeHeadersModule(Callback, p3, p4, p5, p7))
			end), CallbackResult2
		end
	end
end
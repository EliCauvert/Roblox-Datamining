local Parent = script.Parent.Parent.Parent.Parent
local Boolean = require(Parent.LuauPolyfill).Boolean
local PromiseModule = require(Parent.Promise)
local Observable = require(script.Parent.Observable).Observable

return {
	asyncMap = function(p1, p2, p3) --[[ Line: 37 ]]
		-- upvalues: Observable (copy), PromiseModule (copy), Boolean (copy)
		return Observable.new(function(p4) --[[ Line: 42 ]]
			-- upvalues: PromiseModule (upval), Boolean (upval), p2 (copy), p3 (copy), p1 (copy)
			local v1 = nil
			local NextFunction = p4.next
			local ErrorFunction = p4.error
			local CompleteFunction = p4.complete
			local Count = 0
			local Flag = false
			local Promise = {
				andThen = function(_, Callback) --[[ Line: 54 ]]
					-- upvalues: PromiseModule (upval)
					return PromiseModule.new(function(Callback1) --[[ Line: 55 ]]
						-- upvalues: Callback (copy)
						return Callback1(Callback())
					end)
				end
			}
			
			local function _(Callback, Callback1) --[[ Line: 62 | Named "makeCallback" ]]
				-- upvalues: Boolean (upval), Count (ref), Promise (ref), PromiseModule (upval), NextFunction (copy), p4 (copy), Flag (ref), v1 (ref), ErrorFunction (copy)
				return if Boolean.toJSBoolean(Callback) then function(_, p5) --[[ Line: 67 ]]
					-- upvalues: Count (upval), Callback (copy), Promise (upval), PromiseModule (upval), Boolean (upval), NextFunction (upval), p4 (upval), Flag (upval), v1 (upval), ErrorFunction (upval)
					Count += 1
					
					local function both() --[[ Line: 69 ]]
						-- upvalues: Callback (upval), p5 (copy)
						return Callback(p5)
					end
					
					Promise = Promise:andThen(function() --[[ Line: 75 ]]
						-- upvalues: PromiseModule (upval)
						return PromiseModule.delay(0)
					end):andThen(both, both):andThen(function(Result) --[[ Line: 80 ]]
						-- upvalues: Count (upval), Boolean (upval), NextFunction (upval), p4 (upval), Flag (upval), v1 (upval)
						Count -= 1
						
						if Boolean.toJSBoolean(NextFunction) then
							NextFunction(p4, Result)
						end
						if Boolean.toJSBoolean(Flag) then
							v1.complete()
						end
					end, function(p6) --[[ Line: 88 ]]
						-- upvalues: Count (upval)
						Count -= 1
						error(p6)
					end):catch(function(Err) --[[ Line: 92 ]]
						-- upvalues: Boolean (upval), ErrorFunction (upval), p4 (upval)
						if not Boolean.toJSBoolean(ErrorFunction) then return end
						return ErrorFunction(p4, Err)
					end)
				end else function(_, p5) --[[ Line: 100 ]]
					-- upvalues: Boolean (upval), Callback1 (copy), p4 (upval)
					if Boolean.toJSBoolean(Callback1) then
						Callback1(p4, p5)
					end
				end
			end
			
			v1 = {
				next = if Boolean.toJSBoolean(p2) then function(_, p5) --[[ Line: 67 ]]
					-- upvalues: Count (ref), p2 (copy), Promise (ref), PromiseModule (upval), Boolean (upval), NextFunction (copy), p4 (copy), Flag (ref), v1 (ref), ErrorFunction (copy)
					Count += 1
					
					local function both() --[[ Line: 69 ]]
						-- upvalues: p2 (upval), p5 (copy)
						return p2(p5)
					end
					
					Promise = Promise:andThen(function() --[[ Line: 75 ]]
						-- upvalues: PromiseModule (upval)
						return PromiseModule.delay(0)
					end):andThen(both, both):andThen(function(Result) --[[ Line: 80 ]]
						-- upvalues: Count (upval), Boolean (upval), NextFunction (upval), p4 (upval), Flag (upval), v1 (upval)
						Count -= 1
						
						if Boolean.toJSBoolean(NextFunction) then
							NextFunction(p4, Result)
						end
						if Boolean.toJSBoolean(Flag) then
							v1.complete()
						end
					end, function(p6) --[[ Line: 88 ]]
						-- upvalues: Count (upval)
						Count -= 1
						error(p6)
					end):catch(function(Err) --[[ Line: 92 ]]
						-- upvalues: Boolean (upval), ErrorFunction (upval), p4 (upval)
						if not Boolean.toJSBoolean(ErrorFunction) then return end
						return ErrorFunction(p4, Err)
					end)
				end else function(_, p5) --[[ Line: 100 ]]
					-- upvalues: Boolean (upval), NextFunction (copy), p4 (copy)
					if Boolean.toJSBoolean(NextFunction) then
						NextFunction(p4, p5)
					end
				end,
				error = if Boolean.toJSBoolean(p3) then function(_, p5) --[[ Line: 67 ]]
					-- upvalues: Count (ref), p3 (copy), Promise (ref), PromiseModule (upval), Boolean (upval), NextFunction (copy), p4 (copy), Flag (ref), v1 (ref), ErrorFunction (copy)
					Count += 1
					
					local function both() --[[ Line: 69 ]]
						-- upvalues: p3 (upval), p5 (copy)
						return p3(p5)
					end
					
					Promise = Promise:andThen(function() --[[ Line: 75 ]]
						-- upvalues: PromiseModule (upval)
						return PromiseModule.delay(0)
					end):andThen(both, both):andThen(function(Result) --[[ Line: 80 ]]
						-- upvalues: Count (upval), Boolean (upval), NextFunction (upval), p4 (upval), Flag (upval), v1 (upval)
						Count -= 1
						
						if Boolean.toJSBoolean(NextFunction) then
							NextFunction(p4, Result)
						end
						if Boolean.toJSBoolean(Flag) then
							v1.complete()
						end
					end, function(p6) --[[ Line: 88 ]]
						-- upvalues: Count (upval)
						Count -= 1
						error(p6)
					end):catch(function(Err) --[[ Line: 92 ]]
						-- upvalues: Boolean (upval), ErrorFunction (upval), p4 (upval)
						if not Boolean.toJSBoolean(ErrorFunction) then return end
						return ErrorFunction(p4, Err)
					end)
				end else function(_, p5) --[[ Line: 100 ]]
					-- upvalues: Boolean (upval), ErrorFunction (copy), p4 (copy)
					if Boolean.toJSBoolean(ErrorFunction) then
						ErrorFunction(p4, p5)
					end
				end,
				complete = function() --[[ Line: 111 ]]
					-- upvalues: Flag (ref), Boolean (upval), Count (ref), CompleteFunction (copy), p4 (copy)
					Flag = true
					
					if not Boolean.toJSBoolean(Count) and Boolean.toJSBoolean(CompleteFunction) then
						CompleteFunction(p4)
					end
				end
			}
			local SubscribeResult = p1:subscribe(v1)
			
			return function() --[[ Line: 122 ]]
				-- upvalues: SubscribeResult (copy)
				return SubscribeResult:unsubscribe()
			end
		end)
	end
}
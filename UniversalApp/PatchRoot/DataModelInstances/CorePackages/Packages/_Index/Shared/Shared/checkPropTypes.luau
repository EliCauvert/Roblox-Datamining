local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local Error1 = require(Parent.LuauPolyfill).Error
local ConsoleModule = require(script.Parent.console)
local t = {}
local DescribeUnknownElementTypeFrameInDEVFunction = require(script.Parent.ReactComponentStackFrame).describeUnknownElementTypeFrameInDEV
local DescribeError = require(script.Parent["ErrorHandling.roblox"]).describeError
local ReactDebugCurrentFrame = require(script.Parent.ReactSharedInternals).ReactDebugCurrentFrame

local function _(p1) --[[ Line: 34 | Named "setCurrentlyValidatingElement" ]]
	-- upvalues: ReactGlobalsModule (copy), DescribeUnknownElementTypeFrameInDEVFunction (copy), ReactDebugCurrentFrame (copy)
	if ReactGlobalsModule.__DEV__ then
		if p1 then
			local Owner = p1._owner
			ReactDebugCurrentFrame.setExtraStackFrame((DescribeUnknownElementTypeFrameInDEVFunction(p1.type, p1._source, if Owner == nil then nil else Owner.type)))
			
			return
		else
			ReactDebugCurrentFrame.setExtraStackFrame(nil)
		end
	end
end

return function(List, Callback, p1, p2, p3, p4) --[[ Line: 51 | Named "checkPropTypes" ]]
	-- upvalues: ReactGlobalsModule (copy), ConsoleModule (copy), Error1 (copy), DescribeError (copy), DescribeUnknownElementTypeFrameInDEVFunction (copy), ReactDebugCurrentFrame (copy), t (copy)
	if ReactGlobalsModule.__DEV__ or ReactGlobalsModule.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
		if List and Callback then
			ConsoleModule.warn("You've defined both propTypes and validateProps on " .. (p3 or "a component"))
		end
		if Callback then
			if typeof(Callback) == "function" then
				local CallbackResult, CallbackResult2 = Callback(p1)
				
				if not CallbackResult then
					error((string.format("validateProps failed on a %s type in %s: %s", p2, p3 or "<UNKNOWN Component>", (tostring(CallbackResult2 or "<Validator function did not supply a message>")))))
				end
			else
				ConsoleModule.error(("validateProps must be a function, but it is a %s.\nCheck the definition of the component %q."):format(typeof(Callback), p3 or ""))
			end
		end
		if List then
			assert(typeof(List) == "table", "propTypes needs to be a table")
			
			for i, _ in List do
				local _, Result = xpcall(function() --[[ Line: 118 ]]
					-- upvalues: List (copy), i (copy), Error1 (upval), p3 (copy), p2 (copy), p1 (copy)
					if typeof(List[i]) ~= "function" then
						local NewError = Error1.new((p3 or "React class") .. ": " .. p2 .. " type `" .. i .. "` is invalid; " .. "it must be a function, usually from the `prop-types` package, but received `" .. typeof(List[i]) .. "`." .. "This often happens because of typos such as `PropTypes.function` instead of `PropTypes.func`.")
						NewError.name = "Invariant Violation"
						error(NewError)
					end
					return List[i](p1, i, p3, p2, nil, "SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED")
				end, DescribeError)
				local IsTable = typeof(Result) == "table"
				
				if Result ~= nil and not IsTable then
					if ReactGlobalsModule.__DEV__ then
						if p4 then
							local Owner = p4._owner
							ReactDebugCurrentFrame.setExtraStackFrame((DescribeUnknownElementTypeFrameInDEVFunction(p4.type, p4._source, if Owner == nil then nil else Owner.type)))
						else
							ReactDebugCurrentFrame.setExtraStackFrame(nil)
						end
					end
					ConsoleModule.error(string.format("%s: type specification of %s `%s` is invalid; the type checker function must return `nil` or an `Error` but returned a %s. You may have forgotten to pass an argument to the type checker creator (arrayOf, instanceOf, objectOf, oneOf, oneOfType, and shape all require an argument).", p3 or "React class", p2, i, (typeof(Result))))
					
					if ReactGlobalsModule.__DEV__ then
						ReactDebugCurrentFrame.setExtraStackFrame(nil)
					end
				end
				if IsTable and t[Result.message] == nil then
					t[tostring(Result.message)] = true
					
					if ReactGlobalsModule.__DEV__ then
						if p4 then
							local Owner = p4._owner
							ReactDebugCurrentFrame.setExtraStackFrame((DescribeUnknownElementTypeFrameInDEVFunction(p4.type, p4._source, if Owner == nil then nil else Owner.type)))
						else
							ReactDebugCurrentFrame.setExtraStackFrame(nil)
						end
					end
					ConsoleModule.warn(string.format("Failed %s type: %s", p2, (tostring(Result.message))))
					
					if ReactGlobalsModule.__DEV__ then
						ReactDebugCurrentFrame.setExtraStackFrame(nil)
					end
				end
			end
		end
	end
end
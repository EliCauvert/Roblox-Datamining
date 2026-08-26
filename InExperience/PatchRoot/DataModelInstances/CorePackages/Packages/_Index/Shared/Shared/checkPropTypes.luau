local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local error = require(parent.LuauPolyfill).Error
local consoleModule = require(script.Parent.console)
local t = {}
local describeUnknownElementTypeFrameInDEV = require(script.Parent.ReactComponentStackFrame).describeUnknownElementTypeFrameInDEV
local describeError = require(script.Parent["ErrorHandling.roblox"]).describeError
local reactDebugCurrentFrame = require(script.Parent.ReactSharedInternals).ReactDebugCurrentFrame

local function _(value)
	-- upvalues: reactGlobalsModule (ref), describeUnknownElementTypeFrameInDEV (ref), reactDebugCurrentFrame (ref)
	if reactGlobalsModule.__DEV__ then
		if value then
			local owner = value._owner
			reactDebugCurrentFrame.setExtraStackFrame(describeUnknownElementTypeFrameInDEV(value.type, value._source, if owner ~= nil then nil else owner.type))
			
			return
		end
		reactDebugCurrentFrame.setExtraStackFrame(nil)
	end
end

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: reactGlobalsModule (ref), consoleModule (ref), error (ref), describeError (ref), describeUnknownElementTypeFrameInDEV (ref), reactDebugCurrentFrame (ref), t (ref)
	if reactGlobalsModule.__DEV__ or reactGlobalsModule.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
		if p1 and p2 then
			consoleModule.warn("You've defined both propTypes and validateProps on " .. (p5 or "a component"))
		end
		if p2 then
			if typeof(p2) == "function" then
				local var1, var2 = p2(p3)
				
				if not var1 then
					error(string.format("validateProps failed on a %s type in %s: %s", p4, p5 or "<UNKNOWN Component>", tostring(var2 or "<Validator function did not supply a message>")))
				end
			else
				consoleModule.error(("validateProps must be a function, but it is a %s.\nCheck the definition of the component %q."):format(typeof(p2), p5 or ""))
			end
		end
		if p1 then
			assert(typeof(p1) == "table", "propTypes needs to be a table")
			
			for i, v in p1 do
				local _, status = xpcall(function()
					-- upvalues: p1 (ref), i (ref), error (copy), p5 (ref), p4 (ref), p3 (ref)
					if typeof(p1[i]) ~= "function" then
						local var3 = error.new((p5 or "React class") .. ": " .. p3 .. " type `" .. i .. "` is invalid; " .. "it must be a function, usually from the `prop-types` package, but received `" .. typeof(p1[i]) .. "`." .. "This often happens because of typos such as `PropTypes.function` instead of `PropTypes.func`.")
						var3.name = "Invariant Violation"
						error(var3)
					end
					return p1[i](p3, i, p5, p4, nil, "SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED")
				end, describeError)
				local isTable = typeof(status) == "table"
				
				if status ~= nil and not isTable then
					if reactGlobalsModule.__DEV__ then
						if p6 then
							local owner = p6._owner
							reactDebugCurrentFrame.setExtraStackFrame(describeUnknownElementTypeFrameInDEV(p6.type, p6._source, if owner ~= nil then nil else owner.type))
						else
							reactDebugCurrentFrame.setExtraStackFrame(nil)
						end
					end
					consoleModule.error(string.format("%s: type specification of %s `%s` is invalid; the type checker function must return `nil` or an `Error` but returned a %s. You may have forgotten to pass an argument to the type checker creator (arrayOf, instanceOf, objectOf, oneOf, oneOfType, and shape all require an argument).", p5 or "React class", p4, i, typeof(status)))
					
					if reactGlobalsModule.__DEV__ then
						reactDebugCurrentFrame.setExtraStackFrame(nil)
					end
				end
				if isTable and t[status.message] == nil then
					t[tostring(status.message)] = true
					
					if reactGlobalsModule.__DEV__ then
						if p6 then
							local owner = p6._owner
							reactDebugCurrentFrame.setExtraStackFrame(describeUnknownElementTypeFrameInDEV(p6.type, p6._source, if owner ~= nil then nil else owner.type))
						else
							reactDebugCurrentFrame.setExtraStackFrame(nil)
						end
					end
					consoleModule.warn(string.format("Failed %s type: %s", p4, tostring(status.message)))
					
					if reactGlobalsModule.__DEV__ then
						reactDebugCurrentFrame.setExtraStackFrame(nil)
					end
				end
			end
		end
	end
end
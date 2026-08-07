-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:19 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local error = require(parent.LuauPolyfill).Error
local consoleModule = require(script.Parent.console)
local t = {}
local describeUnknownElementTypeFrameInDEV = require(script.Parent.ReactComponentStackFrame).describeUnknownElementTypeFrameInDEV
local describeError = require(script.Parent["ErrorHandling.roblox"]).describeError
local reactDebugCurrentFrame = require(script.Parent.ReactSharedInternals).ReactDebugCurrentFrame

local function _(value) --[[ line: 34 | named "setCurrentlyValidatingElement" ]]
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

return function(p0, p1, p2, p3, p4, p5) --[[ line: 51 | named "checkPropTypes" ]]
	-- upvalues: reactGlobalsModule (ref), consoleModule (ref), error (ref), describeError (ref), describeUnknownElementTypeFrameInDEV (ref), reactDebugCurrentFrame (ref), t (ref)
	if reactGlobalsModule.__DEV__ or reactGlobalsModule.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
		if p0 and p1 then
			consoleModule.warn("You've defined both propTypes and validateProps on " .. (p4 or "a component"))
		end
		if p1 then
			if typeof(p1) == "function" then
				local var3, var4 = p1(p2)
				
				if not var3 then
					error(string.format("validateProps failed on a %s type in %s: %s", p3, p4 or "<UNKNOWN Component>", tostring(var4 or "<Validator function did not supply a message>")))
				end
			else
				consoleModule.error(("validateProps must be a function, but it is a %s.\nCheck the definition of the component %q."):format(typeof(p1), p4 or ""))
			end
		end
		if p0 then
			assert(typeof(p0) == "table", "propTypes needs to be a table")
			
			for i, v in p0 do
				local _, status = xpcall(function() --[[ line: 118 ]]
					-- upvalues: p0 (ref), i (ref), error (copy), p4 (ref), p3 (ref), p2 (ref)
					if typeof(p0[i]) ~= "function" then
						local var6 = error.new((p4 or "React class") .. ": " .. p3 .. " type `" .. i .. "` is invalid; " .. "it must be a function, usually from the `prop-types` package, but received `" .. typeof(p0[i]) .. "`." .. "This often happens because of typos such as `PropTypes.function` instead of `PropTypes.func`.")
						var6.name = "Invariant Violation"
						error(var6)
					end
					return p0[i](p2, i, p4, p3, nil, "SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED")
				end, describeError)
				local isTable = typeof(status) == "table"
				
				if status ~= nil and not isTable then
					if reactGlobalsModule.__DEV__ then
						if p5 then
							local owner = p5._owner
							reactDebugCurrentFrame.setExtraStackFrame(describeUnknownElementTypeFrameInDEV(p5.type, p5._source, if owner ~= nil then nil else owner.type))
						else
							reactDebugCurrentFrame.setExtraStackFrame(nil)
						end
					end
					consoleModule.error(string.format("%s: type specification of %s `%s` is invalid; the type checker function must return `nil` or an `Error` but returned a %s. You may have forgotten to pass an argument to the type checker creator (arrayOf, instanceOf, objectOf, oneOf, oneOfType, and shape all require an argument).", p4 or "React class", p3, i, typeof(status)))
					
					if reactGlobalsModule.__DEV__ then
						reactDebugCurrentFrame.setExtraStackFrame(nil)
					end
				end
				if isTable and t[status.message] == nil then
					t[tostring(status.message)] = true
					
					if reactGlobalsModule.__DEV__ then
						if p5 then
							local owner = p5._owner
							reactDebugCurrentFrame.setExtraStackFrame(describeUnknownElementTypeFrameInDEV(p5.type, p5._source, if owner ~= nil then nil else owner.type))
						else
							reactDebugCurrentFrame.setExtraStackFrame(nil)
						end
					end
					consoleModule.warn(string.format("Failed %s type: %s", p3, tostring(status.message)))
					
					if reactGlobalsModule.__DEV__ then
						reactDebugCurrentFrame.setExtraStackFrame(nil)
					end
				end
			end
		end
	end
end
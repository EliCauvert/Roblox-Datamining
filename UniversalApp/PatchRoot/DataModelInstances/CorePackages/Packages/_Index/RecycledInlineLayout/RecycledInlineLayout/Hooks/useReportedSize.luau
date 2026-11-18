local RecycledInlineLayout = script:FindFirstAncestor("RecycledInlineLayout")
local Parent = RecycledInlineLayout.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local ReportSizeContextModule = require(RecycledInlineLayout.Adapter.ReportSizeContext)
local ReactiveModule = require(RecycledInlineLayout.Utils.Reactive)
local Flag = false

return function(Callback)
	-- upvalues: ReactModule (copy), ReportSizeContextModule (copy), Flag (ref), ReactiveModule (copy), SignalsModule (copy)
	local UseContextResult = ReactModule.useContext(ReportSizeContextModule) or nil
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseContextResult (copy), Flag (upval), ReactiveModule (upval), Callback (copy)
		if UseContextResult ~= nil then
			local PeekResult = ReactiveModule.peek(Callback)
			
			if PeekResult ~= nil then
				UseContextResult(PeekResult)
			end
			return
		elseif not Flag then
			Flag = true
			warn("useReportedSize does nothing outside an Atomic Leaf's view (a Leaf without split)")
		end
	end)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseContextResult (copy), Callback (copy), ReactiveModule (upval), ReactModule (upval), SignalsModule (upval)
		if UseContextResult == nil then
			return nil
		else
			local function reportValue(p1)
				-- upvalues: UseContextResult (upval)
				if p1 ~= nil then
					UseContextResult(p1)
				end
			end
			
			return if ReactiveModule.isBinding(Callback) then ReactModule.__subscribeToBinding(Callback, reportValue) elseif ReactiveModule.isSignal(Callback) then SignalsModule.createEffect(function(p1)
				-- upvalues: Callback (copy), UseContextResult (upval)
				local CallbackResult = Callback(p1)
				
				if CallbackResult ~= nil then
					UseContextResult(CallbackResult)
				end
			end) else nil
		end
	end, { UseContextResult, Callback })
end
-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:34 2026 Pacific Standard Time.

local _ = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local _ = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)

return {
	HydrationStreamMode = ({
		HydrationStreamMode = {
			fromNumber = function(p0) --[[ line: 23 ]]
				return if p0 == 0 then "HYDRATION_STREAM_MODE_INVALID" elseif p0 == 1 then "HYDRATION_STREAM_MODE_SINGLE" elseif p0 == 2 then "HYDRATION_STREAM_MODE_STRUCTURE_THEN_HYDRATION" elseif p0 == 3 then "HYDRATION_STREAM_MODE_ABOVE_FOLD" else nil
			end,
			toNumber = function(p1) --[[ line: 37 ]]
				return if p1 == "HYDRATION_STREAM_MODE_INVALID" then 0 elseif p1 == "HYDRATION_STREAM_MODE_SINGLE" then 1 elseif p1 == "HYDRATION_STREAM_MODE_STRUCTURE_THEN_HYDRATION" then 2 elseif p1 == "HYDRATION_STREAM_MODE_ABOVE_FOLD" then 3 else p1
			end,
			fromName = function(p2) --[[ line: 51 ]]
				return if p2 == "HYDRATION_STREAM_MODE_INVALID" then "HYDRATION_STREAM_MODE_INVALID" elseif p2 == "HYDRATION_STREAM_MODE_SINGLE" then "HYDRATION_STREAM_MODE_SINGLE" elseif p2 == "HYDRATION_STREAM_MODE_STRUCTURE_THEN_HYDRATION" then "HYDRATION_STREAM_MODE_STRUCTURE_THEN_HYDRATION" elseif p2 == "HYDRATION_STREAM_MODE_ABOVE_FOLD" then "HYDRATION_STREAM_MODE_ABOVE_FOLD" else nil
			end
		}
	}).HydrationStreamMode
}
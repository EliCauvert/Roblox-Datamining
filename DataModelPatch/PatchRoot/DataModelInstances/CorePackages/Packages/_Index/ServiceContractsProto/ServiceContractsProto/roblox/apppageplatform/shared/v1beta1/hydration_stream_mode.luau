local _ = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local _ = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)

return {
	HydrationStreamMode = ({
		HydrationStreamMode = {
			fromNumber = function(p1)
				return if p1 == 0 then "HYDRATION_STREAM_MODE_INVALID" elseif p1 == 1 then "HYDRATION_STREAM_MODE_SINGLE" elseif p1 == 2 then "HYDRATION_STREAM_MODE_STRUCTURE_THEN_HYDRATION" elseif p1 == 3 then "HYDRATION_STREAM_MODE_ABOVE_FOLD" else nil
			end,
			toNumber = function(p1)
				return if p1 == "HYDRATION_STREAM_MODE_INVALID" then 0 elseif p1 == "HYDRATION_STREAM_MODE_SINGLE" then 1 elseif p1 == "HYDRATION_STREAM_MODE_STRUCTURE_THEN_HYDRATION" then 2 elseif p1 == "HYDRATION_STREAM_MODE_ABOVE_FOLD" then 3 else p1
			end,
			fromName = function(p1)
				return if p1 == "HYDRATION_STREAM_MODE_INVALID" then "HYDRATION_STREAM_MODE_INVALID" elseif p1 == "HYDRATION_STREAM_MODE_SINGLE" then "HYDRATION_STREAM_MODE_SINGLE" elseif p1 == "HYDRATION_STREAM_MODE_STRUCTURE_THEN_HYDRATION" then "HYDRATION_STREAM_MODE_STRUCTURE_THEN_HYDRATION" elseif p1 == "HYDRATION_STREAM_MODE_ABOVE_FOLD" then "HYDRATION_STREAM_MODE_ABOVE_FOLD" else nil
			end
		}
	}).HydrationStreamMode
}
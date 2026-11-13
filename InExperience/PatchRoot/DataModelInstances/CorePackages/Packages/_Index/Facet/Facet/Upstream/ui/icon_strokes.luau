local function ring(p1, p2, p3, p4: number)
	local List = {}
	
	for i = 0, p4 - 1 do
		local Angle = i / p4 * 3.141592653589793 * 2
		table.insert(List, { p1 + p3 * math.cos(Angle), p2 + p3 * math.sin(Angle) })
	end
	return table.freeze({ closed = true, points = table.freeze(List) })
end

local function open(Tbl)
	return table.freeze({ closed = false, points = table.freeze(Tbl) })
end

local function line(p5, p6, p7, p8)
	-- upvalues: open (copy)
	return open({ { p5, p6 }, { p7, p8 } })
end

local function dot(p5: number, p6)
	-- upvalues: line (copy)
	return line(p5 - 0.03, p6, p5 + 0.03, p6)
end

local Check = { open({ { 0.22, 0.52 }, { 0.42, 0.72 }, { 0.78, 0.3 } }) }

return (table.freeze({
	close = {
		line(0.26, 0.26, 0.74, 0.74),
		line(0.74, 0.26, 0.26, 0.74)
	},
	checkmark = Check,
	check = Check,
	["chevron.leading"] = { open({ { 0.6, 0.22 }, { 0.34, 0.5 }, { 0.6, 0.78 } }) },
	["chevron.trailing"] = { open({ { 0.4, 0.22 }, { 0.66, 0.5 }, { 0.4, 0.78 } }) },
	["chevron.up"] = { open({ { 0.22, 0.6 }, { 0.5, 0.34 }, { 0.78, 0.6 } }) },
	["chevron.down"] = { open({ { 0.22, 0.4 }, { 0.5, 0.66 }, { 0.78, 0.4 } }) },
	["chevron.first"] = {
		table.freeze({
			closed = false,
			points = table.freeze({ { 0.64, 0.22 }, { 0.4, 0.5 }, { 0.64, 0.78 } })
		}),
		line(0.3, 0.22, 0.3, 0.78)
	},
	["chevron.last"] = {
		table.freeze({
			closed = false,
			points = table.freeze({ { 0.36, 0.22 }, { 0.6, 0.5 }, { 0.36, 0.78 } })
		}),
		line(0.7, 0.22, 0.7, 0.78)
	},
	["chevron.up.chevron.down"] = {
		table.freeze({
			closed = false,
			points = table.freeze({ { 0.3, 0.4 }, { 0.5, 0.2 }, { 0.7, 0.4 } })
		}),
		open({ { 0.3, 0.6 }, { 0.5, 0.8 }, { 0.7, 0.6 } })
	},
	increment = { line(0.5, 0.22, 0.5, 0.78), line(0.22, 0.5, 0.78, 0.5) },
	decrement = { line(0.22, 0.5, 0.78, 0.5) },
	menu = {
		line(0.2, 0.3, 0.8, 0.3),
		line(0.2, 0.5, 0.8, 0.5),
		line(0.2, 0.7, 0.8, 0.7)
	},
	more = {
		line(0.22, 0.5, 0.28, 0.5),
		line(0.47, 0.5, 0.53, 0.5),
		dot(0.75, 0.5)
	},
	["facet:search"] = { ring(0.44, 0.44, 0.22, 16), line(0.6, 0.6, 0.8, 0.8) },
	["status.info"] = {
		ring(0.5, 0.5, 0.36, 20),
		line(0.5, 0.46, 0.5, 0.68),
		dot(0.5, 0.34)
	},
	["status.success"] = {
		ring(0.5, 0.5, 0.36, 20),
		open({ { 0.34, 0.52 }, { 0.46, 0.64 }, { 0.66, 0.4 } })
	},
	["status.warning"] = {
		table.freeze({
			closed = true,
			points = table.freeze({ { 0.5, 0.16 }, { 0.86, 0.8 }, { 0.14, 0.8 } })
		}),
		line(0.5, 0.4, 0.5, 0.6),
		dot(0.5, 0.7)
	},
	["status.error"] = {
		ring(0.5, 0.5, 0.36, 20),
		line(0.38, 0.38, 0.62, 0.62),
		line(0.62, 0.38, 0.38, 0.62)
	},
	["facet:selection.radio.off"] = { ring(0.5, 0.5, 0.32, 20) },
	["facet:selection.radio.on"] = { ring(0.5, 0.5, 0.32, 20), ring(0.5, 0.5, 0.12, 10) },
	["facet:selection.check.off"] = {
		(function(Tbl)
			return table.freeze({ closed = true, points = table.freeze(Tbl) })
		end)({
			{ 0.22, 0.22 },
			{ 0.78, 0.22 },
			{ 0.78, 0.78 },
			{ 0.22, 0.78 }
		})
	},
	clock = {
		ring(0.5, 0.5, 0.34, 20),
		open({ { 0.5, 0.3 }, { 0.5, 0.5 }, { 0.64, 0.6 } })
	},
	calendar = {
		table.freeze({
			closed = true,
			points = table.freeze({ { 0.2, 0.26 }, { 0.8, 0.26 }, { 0.8, 0.8 }, { 0.2, 0.8 } })
		}),
		line(0.2, 0.42, 0.8, 0.42),
		line(0.36, 0.16, 0.36, 0.3),
		line(0.64, 0.16, 0.64, 0.3)
	}
}))
local function noop() end

return {
	noopSink = {
		recordDownload = noop,
		recordDecode = noop,
		recordTimeToFirstFrame = noop,
		recordCache = noop,
		recordSoftwareFallback = noop,
		recordDwell = noop
	},
	createLoggingSink = function(p0)
		p0 = p0 or print
		
		return {
			recordDownload = function(p1)
				-- upvalues: p0 (ref)
				p0(`[media] download moment={p1.momentId} kind={p1.assetKind} dt={p1.durationSeconds}s ok={p1.success}`)
			end,
			recordDecode = function(p2)
				-- upvalues: p0 (ref)
				p0(`[media] decode moment={p2.momentId} dt={p2.durationSeconds}s ok={p2.success}`)
			end,
			recordTimeToFirstFrame = function(p3)
				-- upvalues: p0 (ref)
				p0(`[media] ttff moment={p3.momentId} dt={p3.durationSeconds}s`)
			end,
			recordCache = function(p4)
				-- upvalues: p0 (ref)
				p0(`[media] cache moment={p4.momentId} stage={p4.stage} kind={p4.assetKind} hit={p4.hit}`)
			end,
			recordSoftwareFallback = function(p5)
				-- upvalues: p0 (ref)
				p0(`[media] software-fallback moment={p5.momentId}`)
			end,
			recordDwell = function(p6)
				-- upvalues: p0 (ref)
				p0(`[media] dwell moment={p6.momentId} dt={p6.durationSeconds}s`)
			end
		}
	end
}
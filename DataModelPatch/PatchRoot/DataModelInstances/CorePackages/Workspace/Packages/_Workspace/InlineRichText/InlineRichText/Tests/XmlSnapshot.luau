return {
	input = "hello <b>world<i>world2</i>world3<a href=\"link.com\">as<u>df<br/>asdf</a>asdf<strong>asdf",
	tokens = {
		[1] = { attributes = {}, name = "TEXT", text = "hello " },
		[2] = { attributes = {}, name = "OPEN", text = "b" },
		[3] = { attributes = {}, name = "TEXT", text = "world" },
		[4] = { attributes = {}, name = "OPEN", text = "i" },
		[5] = { attributes = {}, name = "TEXT", text = "world2" },
		[6] = { attributes = {}, name = "CLOSE", text = "i" },
		[7] = { attributes = {}, name = "TEXT", text = "world3" },
		[8] = {
			attributes = { href = "link.com" },
			name = "OPEN",
			text = "a"
		},
		[9] = { attributes = {}, name = "TEXT", text = "as" },
		[10] = { attributes = {}, name = "OPEN", text = "u" },
		[11] = { attributes = {}, name = "TEXT", text = "df" },
		[12] = { attributes = {}, name = "BREAK", text = "" },
		[13] = { attributes = {}, name = "TEXT", text = "asdf" },
		[14] = { attributes = {}, name = "CLOSE", text = "a" },
		[15] = { attributes = {}, name = "TEXT", text = "asdf" },
		[16] = { attributes = {}, name = "OPEN", text = "strong" },
		[17] = { attributes = {}, name = "TEXT", text = "asdf" }
	},
	ast = {
		attributes = {},
		children = {
			[1] = {
				attributes = {},
				children = {
					[1] = {
						attributes = {},
						children = {},
						index = 3,
						name = "TEXT",
						text = "hello ",
						type = "PLAINTEXT"
					},
					[2] = {
						attributes = {},
						children = {
							[1] = {
								attributes = {},
								children = {},
								index = 5,
								name = "TEXT",
								text = "world",
								type = "PLAINTEXT"
							},
							[2] = {
								attributes = {},
								children = {
									[1] = {
										attributes = {},
										children = {},
										index = 7,
										name = "TEXT",
										text = "world2",
										type = "PLAINTEXT"
									}
								},
								index = 6,
								name = "i",
								text = "",
								type = "ENGINE_TAG"
							},
							[3] = {
								attributes = {},
								children = {},
								index = 8,
								name = "TEXT",
								text = "world3",
								type = "PLAINTEXT"
							}
						},
						index = 4,
						name = "b",
						text = "",
						type = "ENGINE_TAG"
					}
				},
				index = 2,
				name = "TEXT_SPAN",
				text = "",
				type = "INLINE_CUSTOM"
			},
			[2] = {
				attributes = { href = "link.com" },
				children = {
					[1] = {
						attributes = {},
						children = {},
						index = 10,
						name = "TEXT",
						text = "as",
						type = "PLAINTEXT"
					},
					[2] = {
						attributes = {},
						children = {
							[1] = {
								attributes = {},
								children = {},
								index = 12,
								name = "TEXT",
								text = "df",
								type = "PLAINTEXT"
							}
						},
						index = 11,
						name = "u",
						text = "",
						type = "ENGINE_TAG"
					}
				},
				index = 9,
				name = "LINK",
				text = "",
				type = "INLINE_CUSTOM"
			},
			[3] = {
				attributes = {},
				children = {},
				index = 13,
				name = "BREAK",
				text = "",
				type = "INLINE_CUSTOM"
			},
			[4] = {
				attributes = { href = "link.com" },
				children = {
					[1] = {
						attributes = {},
						children = {
							[1] = {
								attributes = {},
								children = {},
								index = 16,
								name = "TEXT",
								text = "asdf",
								type = "PLAINTEXT"
							}
						},
						index = 15,
						name = "u",
						text = "",
						type = "ENGINE_TAG"
					}
				},
				index = 14,
				name = "LINK",
				text = "",
				type = "INLINE_CUSTOM"
			},
			[5] = {
				attributes = {},
				children = {
					[1] = {
						attributes = {},
						children = {},
						index = 18,
						name = "TEXT",
						text = "asdf",
						type = "PLAINTEXT"
					},
					[2] = {
						attributes = {},
						children = {
							[1] = {
								attributes = {},
								children = {},
								index = 20,
								name = "TEXT",
								text = "asdf",
								type = "PLAINTEXT"
							}
						},
						index = 19,
						name = "b",
						text = "",
						type = "ENGINE_TAG"
					}
				},
				index = 17,
				name = "TEXT_SPAN",
				text = "",
				type = "INLINE_CUSTOM"
			}
		},
		index = 1,
		name = "ROOT",
		text = "",
		type = "ROOT"
	}
}
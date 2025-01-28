#let hw(
	name,
	email,
	course,
	num,
	assignment_type: "HW",
	probword: "Question",
	doc,
) = {
	let assignment_name = assignment_type + " " + str(num)

	set document(
		title: course + " | " +  assignment_name,
		author: name,
	)

	set page(
		paper: "us-letter",
		header: [
			#name #h(1fr) #datetime.today().display("[month repr:long] [day], [year]")\
			#v(-8pt)
			#raw(email) #h(1fr) #course | #assignment_name
			#line(start: (0pt, -8pt), length: 100%, stroke: 0.2mm)
		],
		numbering: "1",
		margin: (
			y: 1.4in,
			x: 1in
		)
	)
	set text(font: "Palatino Linotype", number-type: "old-style", size: 10pt)
	show math.equation: set text(font: ("TeX Gyre Pagella Math"))

	v(-12pt)

	doc
}

#let question(num, body) = {
	text(size: 12pt, smallcaps[Question ])
	text(size: 12pt, str(num))
	v(12pt)
	body
	pagebreak()
}

#let subhead(num, body) = {
	text(size: 11pt, str(num))
	v(2pt)
	body
}

#let continues = {
	align(bottom + right)[
		#text(size: 10pt, smallcaps([Continues ]))
		$-->$
	]
}


#let claim(body) = {
	[_Claim._ ]
	body
}

#let proof(body) = {
	[_Proof._ ]
	body
	box(width: 0pt)
	h(1fr)
	sym.wj
	sym.space.nobreak
	$script(ballot)$  // work around for empty qed, ballot is big so use script size
}

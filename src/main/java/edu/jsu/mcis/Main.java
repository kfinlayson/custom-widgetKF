package edu.jsu.mcis;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class Main extends JPanel implements ShapeObserver {
    private CustomWidget widget;
    private JLabel label;

    public Main() {
        widget = new CustomWidget();
        widget.addShapeObserver(this);
        label = new JLabel("HEXAGON", JLabel.CENTER);
        label.setName("label");
        setLayout(new BorderLayout());
        add(widget, BorderLayout.CENTER);
        add(label, BorderLayout.NORTH);
    }
    
    public void shapeChanged(ShapeEvent event) {
        if(event.isSelected()) { label.setText("HEXAGON"); }
        else { label.setText("OCTAGON"); }
    }


	public static void main(String[] args) {
		JFrame window = new JFrame();
        window.setTitle("Main");
        window.add(new Main());
        window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        window.setSize(500, 500);
        window.setVisible(true);
	}
}
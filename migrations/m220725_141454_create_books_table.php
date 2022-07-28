<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%books}}`.
 */
class m220725_141454_create_books_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%books}}', [
            'id' => $this->primaryKey(),
            'title' => $this->string(255)->unique(),
            'isbn' => $this->integer()->unique(),
            'page_count' => $this->integer(),
            'publishedDate' => $this->dateTime(),
            'thumbnailUrl' => $this->string(255),
            'shortDescription' => $this->text(),
            'longDescription' => $this->text(),
            'status' => $this->string(255),
            'authors' => $this->string(255),
            'categories' => $this->string(255),
            'image' => $this->string(255),
        ]);
        $content = file_get_contents("https://gitlab.com/prog-positron/test-app-vacancy/-/raw/master/books.json");
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%books}}');
    }
}
